// The theme before the first paint: the stored choice, or the system one. The
// React provider takes over from here; without this a dark-mode reader saw the
// page flash white on every load. A file of its own, not inline, so the page's
// content policy can refuse inline scripts.
(function () {
  var choice = "system";
  try { choice = localStorage.getItem("forcebuy.theme") || "system"; } catch (e) {}
  if (choice !== "dark" && choice !== "light") {
    choice = window.matchMedia && window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light";
  }
  document.documentElement.dataset.theme = choice;
})();
