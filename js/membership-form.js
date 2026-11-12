/*
 * Copyright 2026 seL4 International
 * SPDX-License-Identifier: BSD-2-Clause
 */

/* Submission of membership forms. Each form contains its own Friendly Captcha
   widget with a hidden "frc-captcha-response" input inside that form. */

function resetCaptcha(form) {
  const widget = form.querySelector(".frc-captcha")?.frcWidget;
  if (widget) {
    widget.reset();
  }
}

async function submitMembership(form, button) {
  const formData = new FormData(form);
  const solutionToken = formData.get("frc-captcha-response");

  // While the captcha is unsolved, the field holds a status such as ".SOLVING"
  if (!solutionToken || solutionToken.startsWith(".")) {
    alert("Please wait for the captcha to complete before submitting.");
    return;
  }

  const payload = Object.fromEntries(formData.entries());
  payload.solutionToken = solutionToken;

  button.disabled = true;
  try {
    const response = await fetch(form.dataset.endpoint, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(payload)
    });
    const result = await response.json();

    if (response.ok && result.success) {
      alert("Membership submission received successfully!");
      form.reset();
    } else {
      alert("Verification failed: " + (result.message || "Invalid captcha token"));
    }
  } catch (err) {
    console.error("Submission error:", err);
    alert("An error occurred while attempting to submit the form.");
  } finally {
    button.disabled = false;
    // captcha token can only be used once
    resetCaptcha(form);
  }
}

document.querySelectorAll("form[data-endpoint]").forEach(function (form) {
  form.addEventListener("submit", function (e) {
    e.preventDefault();
    submitMembership(form, e.submitter);
  });
});
