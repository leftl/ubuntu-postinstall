// Linux Specific
user_pref("widget.content.gtk-theme-override", "Adwaita"); // fixes dark page elements from GTK
user_pref("layers.acceleration.force-enabled", true); // fixes screen tearing while scrolling

// Personal settings/preferences
user_pref("browser.startup.homepage", "about:newtab");
user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("network.IDN_show_punycode", true);
user_pref("general.warnOnAboutConfig", false);
user_pref("browser.onboarding.enabled", false);
user_pref("extensions.pocket.enabled", false);
user_pref("extensions.pocket.api", "");
user_pref("browser.shell.checkDefaultBrowser", false);

// Privacy/telemetry/experiments
//user_pref("privacy.firstparty.isolate", true);
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("privacy.resistFingerprinting", true);
user_pref("breakpad.reportURL", "");
user_pref("browser.send_pings", false);
user_pref("browser.selfsupport.url", "");
user_pref("browser.ping-centre.telemetry", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.cachedClientID", "");
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("experiments.supported", false);
user_pref("experiments.enabled", false);
user_pref("experiments.manifest.uri", "");
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.healthreport.service.enabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled",	false);
user_pref("network.allow-experiments", false);
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");
user_pref("loop.logDomains", false); // hello telemetry

// Disable addon recommendations
user_pref("browser.discovery.enabled", false);
user_pref("browser.discovery.containers.enabled", false);
user_pref("browser.discovery.sites", "");
user_pref("extensions.getAddons.showPane", false);
user_pref("extensions.webservice.discoverURL", "");
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr", false);
