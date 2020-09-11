# Main handler(s) for python template code.
# Copyright 2019 CSIRO
# Copyright 2020 seL4 Project a Series of LF Projects, LLC.
#
# SPDX-License-Identifier: GPL-2.0-only
#

import sys, os, imp, re, string, cgi, time, traceback
import itertools as IT
from io import StringIO

from lxml import etree

from sqlobject import OR
#import cProfile
from ertos_config import cfg           # site config
from urllib.parse import urlparse, parse_qs
from ertos_nav import dir2list
import codecs

cfg.read('config.cfg')
in_production = cfg.getboolean('core', 'production')

if not in_production:
    from tidylib import Tidy

# FIXME: The entire website is very "stringly"-typed.

try:
    import mod_python
    from mod_python import apache, psp
except:
    pass

def debug(s):
# (benjl) Set log_level to 0 if you don't want crap in the log file.
    #apache.log_error(s, apache.APLOG_ERR)
    apache.log_error(s, apache.APLOG_DEBUG)

def flatten(inlist, ltype=(list, tuple), maxint=sys.maxsize):
    """Flatten out a list. Stolen from:
    http://sourceforge.net/project/showfiles.php?group_id=87034&package_id=0541&release_id=288585
    """
    try:
        # for every possible index
        for ind in range(maxint):
            # while that index currently holds a list
            while isinstance(inlist[ind], ltype):
                # expand that list into the index (and subsequent indicies)
                inlist[ind:ind + 1] = list(inlist[ind])
            #ind = ind+1
    except IndexError:
        pass
    return inlist


def get_breadcrumbs(req):
    """return [(name,url), ..]"""
    crumbs = []

    f = open(os.path.join(content_dir, '.breadcrumbs'), "r")
    for line in f.readlines():
        if line.startswith('#'):
            continue
        if '|' in line:
            t = line.split('|')
            for i in range(len(t)):
                t[i] = t[i].strip()           # remove un-needed white spaces
            crumbs.append(t)
    f.close()

    path = req.filename[len(content_dir):]
    if path[0] != '/':
        path = '/' + path
    if path != '':
        crumbs = crumbs + make_crumb_tree(req, content_dir, path)
    return crumbs


def make_crumb_tree(req, basedir, path):
    name = os.path.basename(path)
    parent = os.path.dirname(path)
    # if name is in parent's ignore list, then don't display it.
    ignore = get_ignore_list(req, os.path.join(basedir, parent[1:]))
    # Check for a .name directory in the parent,
    # use a name from there if found.
    origname = name
    names_file = os.path.join(basedir, parent[1:], '.names')
##    debug("Checking names: %s\n" % names_file)
    if os.path.isfile(names_file):
        for line in addresses_from_file(names_file):
##            debug("line[0] <%s> : Name: <%s>\n" % (line[0], name))
            # Lines in .names look like "filename | crumbname | menu name"
            if line[0] == name:
                name = line[1]
    name = str.replace(name, '_', ' ')

    if name.endswith('.pml') or name.endswith('.pyl'):
        name = name[:-4]

    if not os.path.isfile(os.path.join(basedir, path[1:])):
        path = path + "/"

    if parent == '/':
        return [(converttitle(name), path)]
    x = make_crumb_tree(req, basedir, parent)
    if origname in ignore:
        pass
    else:
        x.append((converttitle(name), path))
    return x


def get_ignore_list(req, dir):
    """Return a list of elements to be ignored from the .ignore file
    in dir, as well as a .top_ignore file, if found.
    dir must be a fully-qualified local path."""
    basedir = req.get_options()['base_dir']
    ignore = []
    if os.path.isfile(os.path.join(dir, ".ignore")):
        ignore += readfile(os.path.join(dir, ".ignore"))
    if os.path.isfile(os.path.join(basedir, ".top_ignore")):
        ignore += readfile(os.path.join(basedir, ".top_ignore"))
    return ignore

def converttitle(title):
    """Reformat the given text for menu display."""
    # Only change capitalisation if title is all lower-case
    if re.search('[A-Z]', title) is None:
        return title.title()
    return title


def send_menu_elements(req, bibargs, dir, todo, depth):
    urlbase = req.get_options()["base_url"]
    basedir = req.get_options()["base_dir"]
    parent = dir[len(basedir):]

    ignore = get_ignore_list(req, dir)

    # All files is a dictionary mapping a tuple (x, name) -> url
    # x is a magic integer used for sorting purposes
    allfiles = {}
    translate = {}

    for filename in os.listdir(dir):
        if ((os.path.isfile(os.path.join(dir, filename)) and
             (filename.endswith(".pml") or filename.endswith(".pyl")) or
             os.path.isdir(os.path.join(dir, filename))) and
                filename not in ignore):
            if os.path.isdir(os.path.join(dir, filename)):
                allfiles[(0, filename)] = '/%s/' % os.path.join(parent, filename)
                # allfiles.append([filename, '/%s/' % os.path.join(parent, filename)])
                Translate[filename] = converttitle(filename)
            elif os.path.isfile(os.path.join(dir, filename)):
                allfiles[(0, filename)] = '/%s' % os.path.join(parent, filename)
                # allfiles.append([title, '/%s' % os.path.join(parent, filename)])
                # Normal path names need extensions stripped now
                title = filename
                if title.endswith('.pml') or title.endswith('pyl'):
                    title = title[:-4]
                translate[filename] = converttitle(title)

    debug("allfiles: %s\n" % allfiles)
    sortedfiles = []
    i = 0
    if os.path.isfile(os.path.join(dir, ".menu.py")):
        filepathname = os.path.join(dir, ".menu.py")
        f = codecs.open(filepathname, encoding='utf-8', mode="U")
        menu = imp.load_source('menu', filepathname, f)
        sortedfiles = menu.menulist(req)

    elif os.path.isfile(os.path.join(dir, ".menu")):
        for line in readfile(os.path.join(dir, ".menu")):
            i += 1
            name, address = line.split("|")
            sortedfiles.append((name.strip(), address.strip()))
    else:
        order = []
        if os.path.isfile(os.path.join(dir, ".order")):
            order = readfile(os.path.join(dir, ".order"))

        if os.path.isfile(os.path.join(dir, '.baselinks')):
            for entry in addresses_from_file(os.path.join(dir, '.baselinks')):
                allfiles[(0, entry[0])] = entry[1]

        if os.path.isfile(os.path.join(dir, ".names")):
            for entry in addresses_from_file(os.path.join(dir, ".names")):
                # entries are [file, breadcrumb_text, menu_text]
                translate[entry[0]] = entry[2]

        # allfiles.sort()

        for fn in order:
            debug("fn: %s\n" % fn)
            if fn == ".menu":
                debug("Inserting menu\n")
                # Place all the .menu items here. .menu items have sort key greater than zero
                for key in [key for key in allfiles if key[0] > 0]:
                    debug("Menu key: %s\n" % (key, ))
                    sortedfiles.append([key[-1], allfiles[key]])
                    del allfiles[key]
            elif (0, fn) in allfiles:
                sortedfiles.append([fn, allfiles[(0, fn)]])
                del allfiles[(0, fn)]
            elif fn == "--line":
                sortedfiles.append([fn, "--line"])

                # break
            #elif fn[1] != "" and os.path.isdir(os.path.join(dir, fn[1])):
            #    realfiles.append(fn)

        fn = list(allfiles.keys())
        fn.sort()
        for key in fn:
            sortedfiles.append([key[-1], allfiles[key]])

        debug("Sorted files: %s\n" % sortedfiles)

    for fn in sortedfiles:
        # Is this fn our current directory?
        if  fn[0] == todo[0]:
            IN_CURRENT = 1
        else:
            IN_CURRENT = 0

        if  fn[0] == '--line':
            req.write("""
                <tr>
                <td colspan="5" bgcolor=white>
                <img src="/images/spacer.gif" width="1" height="1"
                   alt="" border="0" />
                </td>
                </tr>
                <tr>
                <td colspan="5">
                   <img src="/images/spacer.gif" height="5" width="1"
                    alt="" border="0" />
                </td>
                </tr>
            """)
        else:
            req.write('<tr>')
            # Indenting cell
            if depth >= 0:
                req.write('<td colspan="%s"><img src="/images/spacer.gif" width="1" height="1" alt="" border="0" /></td>' % (1+depth))
            req.write('<td colspan="%s" valign="top"> <a ' % (4-depth))
            if IN_CURRENT and ((len(todo) == 1) or (todo[1] == 'home.pml')):
                req.write('class="nav2_on" ')
            else:
                req.write('class="nav2" ')
            url = fn[1]
            if fn[0] in translate:
                name = translate[fn[0]]
            else:
                name = fn[0]
                #.capitalize()
            req.write('href="%s">%s</a>' % (url, name))
##            debug(str(urlparse(url)))

            req.write('</td></tr>\n')
            req.write('<tr><td colspan="5"><img src="/images/spacer.gif" width="0" height="10" alt="" border="0" /></td></tr>\n')

            # If this is the current one, then we recurse now.
            if IN_CURRENT:
                foo = os.path.normpath("%s/%s" % (dir, todo[0]))
                bar = todo[1:]
                # if len(bar) and bar[0] does not end pml or such
                if len(bar) and os.path.isdir(foo):
                    send_menu_elements(req, bibargs, foo, bar, depth + 1)

def get_news_elements(item_count=6, max_title_len=80, max_story_len=350):

    # Get news file, surround it by parent tags, and then join together
    basedir = cfg.get('core', "base_dir")
    news = ["<xml>"]
    news.extend(readfile(os.path.join(basedir, "content/news/home.pml")))
    news.append("</xml>")
    news = "\n".join(news)

    # Preprocess string for ultra-conservative parser
    news = re.sub(r"&\S*;", " ", news)
    news = news.replace("<br>", "<br />")

    parser = etree.HTMLParser()
    tree = etree.parse(StringIO(news), parser)

    news_items = []
    for entry in tree.iter('tr'):       # Go through each row
        for title in entry.iter('th'):  # Titles
            txt = "".join(list(title.itertext()))
            txt = txt[:max_title_len-3] + "..." if len(txt) > max_title_len else txt
        for body in entry.iter('td'):   # Stories
            txt = "".join(list(body.itertext()))
            txt = txt[:max_story_len-3] + "..." if len(txt) > max_story_len else txt

        news_items.append(txt.strip().replace('\n', ' '))

        if len(news_items) >= item_count * 2:
            break

    news_elements = [news_items[i:i+2] for i in range(0, len(news_items), 2)]

    return news_elements

def readfile(f):
    fh = open(f)
    output = []
    for line in fh:
        line = str.lstrip(line).rstrip('\n')
        if len(line) is not 0 and line[0] != '#' and line[0] != '\n':
            output.append(line)
    return output

def addresses_from_file(f):
    output = []
    for line in readfile(f):
        if '|' in line:
            t = line.split('|')
            # splitting list elements in-place
            for ele in range(len(t)):
                t[ele] = t[ele].strip()
            output.append(t)
        else:
            output.append([line, line])
    return output

# This function is recursive to display the links in the correct
# indentation for all subdirectories and only display the stuff in the
# directories leading up to the asked for page
# here we need to check
# whether an order preference is given for the specific directory ".order"
# if .order is not provided, it is assumed that all directory and
# subdirectory are publically accessible and are sorted
# by alphabet
# we need to check for ".basedir" entries, which are displayed whether
# there are relevant directory entries or no and link to the main page.
# this ".basedir" entries have to present in the ".order" file (or
# picked anyway, if ".order" is absent


# this spills out the entries in the right hand navigation menu of the pages
def send_menu(req, bibargs=None):
    req.write('<!-- Automated menu entries -->\n')
    urlbase = req.get_options()["base_url"]
    basedir = req.get_options()["base_dir"]
    codedir = req.get_options()["code_dir"]

    if ((req.uri == "/home.pml") or (len(req.uri) == 1)):
        f = open(os.path.join(codedir, "toplevelmenu.html"), "r")
        ignore = get_ignore_list(req, basedir)
        entry = ""
        if "jobs" not in ignore:
            entry = """
                <tr>
                <td></td><td></td><td></td><td colspan="2">
                <a href="/jobs/home.pml" class="nav2">Jobs</a></td></tr>
                <tr><td colspan="5"><img src="/images/spacer.gif" width="0"
                height="10" alt="" border="0" /></td></tr>
            """
        req.write((f.read() % entry))
        f.close()
    else:
        parts = req.filename[len(basedir):].split(os.path.sep)
        if parts[0] == '':
            parts = parts[1:]
        send_menu_elements(req, bibargs, basedir, parts, 0)



def parse_pml(req, text):
    splits = re.split(r'(\<execute.*)\/\>', text)
    for each in splits:
        if each.startswith("<execute"):
            call = re.search(r'call\W*\=\"(.*)\"', each).group(1)
            req.write(eval(call))
        else:
            req.write("%s" % each)

def req_to_title(req):
    basedir = cfg.get('core', "base_dir")

    # Convert a request to a guess at what the title should be
    parse_filename = req.filename[len(basedir):-4]
    if parse_filename.endswith("home"):
        parse_filename = parse_filename[:-5]
    parts = parse_filename.split("/")
    title = ""
    if len(parts) > 1:
        title = "%s - %s -" % (parts[-2], parts[-1])
    elif len(parts) > 0:
        title = "%s -" % parts[0]
    if title == " -":
        title = ""
    if title == " - -":
        title = ""

    return title

class DummyPage:
    def __init__(self, req):
        self._title = "Untitled"
        self.page = []
        self.req = req # Needed for POSTdata processing

    def __getattr__(self, key):
        # I'm sure this is in GoF. Maybe the "Dodgy Hack Class Watcher" or something
        if key not in self.__dict__:
            return getattr(self.__dict__['req'], key)

    def __getitem__(self, key):
        return self.__dict__['req'][key]

    def get_title(self):
        return self._title

    def set_title(self, title):
        self._title = title

    title = property(get_title, set_title)

    def write(self, data, *args, **kws):
        assert kws == {}
        self.page.append(data)

    def get_page(self):
        return ' '.join(self.page)


def py_handler(req, query, messagens):
    f = open(req.filename, "r")
    filepath, filename = os.path.split(req.filename)
    oldpath = sys.path
    sys.path.append(filepath) #Allow files to import from their directory - bad?
    module = imp.load_source(os.path.splitext(filename)[0], req.filename, f)
    sys.path = oldpath
    req.content_type = "text/html; charset=utf-8"
    pagedict = None
    if "makepage" in dir(module):
        pagedict = DummyPage(req)
        module.makepage(pagedict)
    elif "get_title" in dir(module):
        title = module.get_title(req)
    else:
        title = req_to_title(req)
    req.send_http_header()
    if pagedict:
        send_header(req, pagedict.title)
        req.write(pagedict.get_page())
    else:
        send_header(req, title)
        module.handler(req, query)
    send_footer(req)
    return apache.OK

def pyl_handler(req, query, messages):
    """new version of py_handler() to work with PSP templates"""

    # get string from our customized handler()
    fakereq = DummyPage(req)
    fakereq.user = req.user
    try:
        f = open(req.filename, "r")
        filepath, filename = os.path.split(req.filename)
        oldpath = sys.path
        sys.path.append(filepath) #Allow files to import from their directory - bad?
        module = imp.load_source(os.path.splitext(filename)[0], req.filename, f)
    except:
        req.status = apache.HTTP_NOT_FOUND
        return apache.OK

    sys.path = oldpath
    status = module.handler(fakereq, query)
    user_content = fakereq.get_page()

    # if this is a file download, then don't spit out template
    if "Content-Disposition" in req.headers_out:
        return apache.OK

    if cfg.has_option('core', 'titletemplate'):
        title = cfg.get('core', 'titletemplate')
    else:
        title = "%s | seL4" % cfg.get('core', 'rg_abbrev').upper()

    if "get_title" in dir(module):
        title = module.get_title(req) + " | " + title

    usr_head_content = ""
    if "get_head" in dir(module):
        usr_head_content = module.get_head(req)

    breadcrumbs = get_breadcrumbs(req)
    data = dict(cfg=cfg, psp=psp, breadcrumbs=breadcrumbs, title=title,
                user_content=user_content,
                user_head_content=usr_head_content,
                nav_urls=nav_urls, messages=messages)
    template_file = cfg.get('core', 'template_file')
    if 'media' in query:
        if query['media'][0] == 'print':
            template_file = cfg.get('core', 'template_file_print')

    if status != 0:
        req.status = status

    try:
        template = psp.PSP(req, filename=template_file)
    except Exception as e:
        req.write("psp failed: %s" % str(e))
        return apache.OK


    req.content_type = "text/html; charset=utf-8"
    try:
        template.run(data)
    except apache.SERVER_RETURN:
        req.page = fakereq.page
        req.status = fakereq.status
        return apache.OK
    except Exception as e:
        req.write("template run failed: %s" % str(e))
    return apache.OK


def pyx_handler(req, query, messages):
    """Basically calling user's handler() without setting content type
    --- for binary stuff like photos"""

    f = open(req.filename, "r")
    filepath, filename = os.path.split(req.filename)
    oldpath = sys.path
    sys.path.append(filepath) #Allow files to import from their directory - bad?
    module = imp.load_source(os.path.splitext(filename)[0], req.filename, f)
    sys.path = oldpath

    module.handler(req, query)

    return apache.OK

def psp_handler(req, query, messages):
    req.content_type = "text/html; charset=utf-8"

    if not os.path.isfile(req.filename) and \
       not (req.filename.endswith('_') and os.path.isfile(req.filename[:-1])):
        req.send_http_header()
        return apache.HTTP_NOT_FOUND

    # Debugging output.  Needs PythonDebug in the apache conf.
    if req.filename.endswith('_'):
        req.send_http_header()
        return psp.handler(req)

    user_content = ''

    # trick PSP to give us a string for the user page
    # and pass it to the template
    fakereq = DummyPage(req)
    user_page = psp.PSP(fakereq, filename=req.filename)
    data = dict(cfg=cfg)
    try:
        user_page.run(data)
    except apache.SERVER_RETURN:
        req.page = fakereq.page
        req.status = fakereq.status
        return apache.OK
    user_content = fakereq.get_page()

    # some variables needed in our templates
    breadcrumbs = get_breadcrumbs(req)

    f = open(req.filename, "r")
    title_re = re.search(r"\<title\>(.*)\<\/title\>", f.read())
    f.close()
    # If the user content was a tuple, it means we specified extra data for the <head>
    user_head_content = ""
    if type(user_content) is tuple:
        user_head_content = user_content[1]
        user_content = user_content[0]

    if cfg.has_option('core', 'titletemplate'):
        title = cfg.get('core', 'titletemplate')
    else:
        title = "%s | CSIRO's Data61" % cfg.get('core', 'rg_abbrev').upper()


    if title_re:
        title_end = title_re.end()
        title = "%s | %s" % (title_re.groups()[0], title)
    else:
        # Default to the ugly URL
        cur_url = req.filename[len(cfg.get('core', 'content_dir')):].strip('/')
        live_url = '%s' % cfg.get('hosts', 'url')+'/'+cur_url
        live_url = cur_url

        # Set the title
        title = "%s | %s" % (title, live_url)

    # See if page is requesting custom banner
    banner_img = None
    f = open(req.filename, "r")
    banner_re = re.search(r"\<banner\>(.*)\<\/banner\>", f.read())
    f.close()

    if banner_re:
        banner_img = banner_re.groups()[0]

    data = dict(psp=psp, breadcrumbs=breadcrumbs, title=title,
                banner_img=banner_img, user_head_content=user_head_content,
                user_content=user_content, cfg=cfg, nav_urls=nav_urls,
                messages=messages)

    template_file = cfg.get('core', 'template_file')
    if 'media' in query:
        if query['media'][0] == 'print':
            template_file = cfg.get('core', 'template_file_print')
    try:
        template = psp.PSP(req, filename=template_file)
    except Exception as e:
        req.send_http_header()
        req.write("Template prep failed, $s\n", str(e))
        traceback.print_exc()
        return apache.OK

    req.send_http_header()
    try:
        template.run(data)
    except Exception as e:
        req.write("template run failed, %s\n" % str(e))
        traceback.print_exc()
    return apache.OK


def edit_handler(req, query, messages):
    req.content_type = "text/html"

    if not os.path.isfile(req.filename) and \
       not (req.filename.endswith('_') and os.path.isfile(req.filename[:-1])):
        req.send_http_header()
        return apache.HTTP_NOT_FOUND

    if req.filename.endswith('_'):
        req.send_http_header()
        return psp.handler(req)

    user_content = ''

    if not os.path.isfile(req.filename) or os.path.islink(req.filename) or \
            not (req.filename.endswith('.pml') or req.filename.endswith('.html')):
        sorry_text = """
                <html><head><title>Can't edit this file | %s </title></head><body><h1>Can't edit this content</h1>
                <p>To edit underlay or python code, ssh to the site</p>
                </body></html>
            """ % cfg.get('core', 'rg_abbrev').upper()
        req.write(sorry_text)
        return apache.HTTP_FORBIDDEN

    f = open(req.filename, 'r')
    title_re = re.search(r"\<title\>(.*)\<\/title\>", f.read())
    f.close()
    if title_re:
        title = "Edit %s | %s " % (title_re.groups()[0], cfg.get('core', 'rg_abbrev').upper())
    else:
        title = "Edit %s | %s " % (req.filename, cfg.get('core', 'rg_abbrev').upper())

    # See if page is requesting custom banner
    banner_img = None

    f = open(req.filename, 'r')
    banner_re = re.search(r"\<banner\>(.*)\<\/banner\>", f.read())
    f.close()
    if banner_re:
        banner_img = banner_re.groups()[0]

    breadcrumbs = get_breadcrumbs(req)
    f = open(req.filename, "r")
    user_content = f.read()
    f.close()
    data = dict(psp=psp, breadcrumbs=breadcrumbs, title=title, banner_img=banner_img,
                user_head_content='',
                user_content=user_content, cfg=cfg,
                nav_urls=nav_urls, messages=messages)

    template_file = cfg.get('core', 'template_file_edit')
    template = psp.PSP(req, filename=template_file)
    template.run(data)
    return apache.OK

def validate_handler(req, query, messages):

    path = req.filename

    req.filename = content_dir + "validator/home.pyl"

    """new version of py_handler() to work with PSP templates"""

    # get string from our customized handler()
    fakereq = DummyPage(req)
    f = open(req.filename, "r")
    filepath, filename = os.path.split(req.filename)
    oldpath = sys.path
    sys.path.append(filepath) #Allow files to import from their directory - bad?
    module = imp.load_source(os.path.splitext(filename)[0], req.filename, f)
    sys.path = oldpath
    module.handler(fakereq, query, path)
    user_content = fakereq.get_page()
    f.close()

    title = ("%s | Validation Check - " % cfg.get('core', 'rg_abbrev').upper()) + path

    breadcrumbs = get_breadcrumbs(req)
    data = dict(cfg=cfg, psp=psp, breadcrumbs=breadcrumbs, title=title,
                user_content=user_content, nav_urls=nav_urls, messages=messages)

    template = psp.PSP(req, filename=cfg.get('core', 'template_file'))
    template.run(data)

    return apache.OK

def save_handler(req, query, messages):
    path = req.filename
    content_dir = cfg.get('core', 'content_dir')

    length = int(req.headers_in['content-length'])
    postvars = parse_qs(req.read(length), keep_blank_values=1)
    if b'content' not in postvars:
        return apache.HTTP_NOT_FOUND


    # Editor adds <p>&nbsp;</p> if file starts with a blank line or a comment
    user_content = postvars[b'content'].pop().decode('utf-8').replace(r'<p>&nbsp;</p>', '', 1)

    tidy = Tidy()
    OPTIONS = {
        'wrap': 72,
        'hide-comments' : 'no',
        'preserve-entities': 'yes',
        'char-encoding' : 'utf8',
        'indent-attributes' : 'yes',
    }
    doc = '<!DOCTYPE html><head><title>foo</title></head><body>' + user_content + '</body></html>'
    doc, errs = tidy.tidy_document(doc, options=OPTIONS)

    if errs is not '':
        req.write("<strong>Errors found</strong><br/><pre>")
        req.write(cgi.escape(errs))
        req.write("</pre>")
        return apache.OK

    doc = re.sub(r'^.*<body>(.*)</body>.*', r'\1', doc, flags=re.DOTALL)
    doc = re.sub(r'^    ', '', doc, flags=re.MULTILINE)
    if path.startswith(content_dir):
        filename = path + ".new"
        f = open(filename, "w")
        f.write(doc)
        f.close()
        os.rename(filename, path)
        os.chmod(path, 0o664)
    else:
        req.write("<strong>Attempt to update a file not in the web directory</strong>")
        return apache.HTTP_FORBIDDEN

    if 'save' in query:
        del query['save']
    req.args = req.args.replace('?save', '')
    return psp_handler(req, query, messages)


def linklint_handler(req, query, messages):

    path = req.filename

    req.filename = content_dir + "validator/linklint.pyl"

    """new version of py_handler() to work with PSP templates"""

    # get string from our customized handler()
    fakereq = DummyPage(req)
    f = open(req.filename, "r")
    filepath, filename = os.path.split(req.filename)
    oldpath = sys.path
    sys.path.append(filepath) #Allow files to import from their directory - bad?
    module = imp.load_source(os.path.splitext(filename)[0], req.filename, f)
    sys.path = oldpath
    module.handler(fakereq, query, path)
    user_content = fakereq.get_page()

    title = ("%s | Linklint Check - " % cfg.get('core', 'rg_abbrev').upper()) + path

    breadcrumbs = get_breadcrumbs(req)
    data = dict(cfg=cfg, psp=psp, breadcrumbs=breadcrumbs, title=title,
                user_content=user_content, nav_urls=nav_urls, messages=messages)

    template = psp.PSP(req, filename=cfg.get('core', 'template_file'))
    template.run(data)

    f.close()

    return apache.OK

def search_handler(req, query, messages):

    path = os.path.dirname(req.filename)
    fakereq = DummyPage(req)
    f = open(req.filename, "r")
    filepath, filename = os.path.split(req.filename)
    oldpath = sys.path
    sys.path.append(filepath) #Allow files to import from their directory - bad?
    module = imp.load_source(os.path.splitext(filename)[0], req.filename, f)
    sys.path = oldpath
    module.handler(fakereq, query, path)
    user_content = fakereq.get_page()
    title = module.get_title(req, query, path)

    breadcrumbs = get_breadcrumbs(req)

    data = dict(cfg=cfg, psp=psp, breadcrumbs=breadcrumbs, title=title,
                user_content=user_content, nav_urls=nav_urls, messages=messages)

    template = psp.PSP(req, filename=cfg.get('core', 'template_file'))
    template.run(data)

    return apache.OK

def get_logged_in_user(req):
    req.get_basic_auth_pw() # Need to call this according to mod_python docs
    if req.user is None:
        return None
    username = req.user.lower()
    return username

def handler(req):
    import time
    start = time.time()

    if not os.path.isfile(req.filename):
        return apache.HTTP_NOT_FOUND

    # reads config and set some global variables
    global base_dir, content_dir, nav_urls
    #cfg.read(req.get_options()['site_config'])

    base_dir = cfg.get('core', 'base_dir') + "/"
    content_dir = cfg.get('core', 'content_dir') + "/"
    in_production = cfg.getboolean('core', 'production')

    d = os.path.dirname(req.filename)
    nav_urls = dir2list(content_dir)

    req.content_type = "text/html"
    if req.args is not None:
        query = cgi.parse_qs(req.args)
    else:
        query = {}

    # TODO: Make "messages" append to an error log instead
    messages = []

    try:
        res = apache.OK

        if not in_production and req.args is not None:
            if 'linklint' in req.args:
                return linklint_handler(req, query, messages)
            if 'validate' in req.args:
                return validate_handler(req, query, messages)
            if 'save' in req.args:
                return save_handler(req, query, messages)
            if 'edit' in req.args:
                return edit_handler(req, query, messages)

        if req.filename.endswith('search/home.pyl'):
            res = search_handler(req, query, messages)
        elif req.filename.endswith(".pml") or req.filename.endswith('.psp'):
            res = psp_handler(req, query, messages)
        elif req.filename.endswith(".pyl"):
            res = pyl_handler(req, query, messages)
        elif req.filename.endswith(".pyx"):
            res = pyx_handler(req, query, messages)
        else:
            res = apache.HTTP_NOT_FOUND

        if req.content_type == "text/html":
            req.write("<!-- page generated in %s seconds -->" % str(time.time() - start))

        return res

    except Exception as e:
        # cgitb should NEVER be used on the live public site
        # it can leak internal data like usernames and passwords
        formatted_lines = traceback.format_exc().splitlines()

        tb = ""
        for line in formatted_lines:
            tb += line +"\n"

        if not in_production:
            import cgitb
            #cgitb.enable()
            cgitb.Hook(file=req).handle()

        sorry_text = """<html><head><title>404 Not Found | %s | Data61</title></head><body><h1>404 Not Found</h1>
        <p>Some content in this page is currently unavailable or no longer exists.<br/>
        The webmaster has been notified. Please try again later.</p></body></html>
        """ % cfg.get('core', 'rg_abbrev').upper()
        req.write(sorry_text)

        if not in_production:
            req.write("<p>Traceback:</p>")
            req.write("<p>"+tb.replace("\n", "<br />")+"</p>")

        if in_production:
            # send webmasters a mail with the trace
            import smtplib, time
            from email.mime.text import MIMEText
            text = """
Problem with %s webpage at:
    %s:%s.

Please check...

Trace follows:

%s

Arguments (if any):

%s

mod-python hard working at %s
            """ % (cfg.get('core', 'rg_abbrev').upper(),
                   req.server.server_hostname,
                   req.filename, tb, str(query),
                   time.strftime('%x %X %Z'))
            msg = MIMEText(text)
            md = cfg.get('hosts', 'maildomain')
            mx = cfg.get('hosts', 'mailhost')
            webmasters = ['webmaster@' + md]
            msg['Subject'] = '<%s Web> - Exception caught' % cfg.get('core', 'rg_abbrev').upper()
            msg['From'] = 'webmaster@' + md
            msg['To'] = 'webmaster@' + md

            s = smtplib.SMTP()
            s.connect(mx)
            s.sendmail(webmasters[0], webmasters, msg.as_string())
            s.close()

    return apache.OK
