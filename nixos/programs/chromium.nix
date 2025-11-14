{
  programs.chromium = {
    enable = true;
    extraOpts = {
      BrowserSignin = 0;
      SyncDisabled = true;
      PasswordManagerEnabled = false;
      SpellcheckEnabled = false;
      HideWebStoreIcon = true;
      MetricsReportingEnabled = false;
      BrowserNetworkTimeQueriesEnabled = false;
      DeviceMetricsReportingEnabled = false;
      DomainReliabilityAllowed = false;
      FeedbackSurveysEnabled = false;
      SpellCheckServiceEnabled = false;
      AllowSystemNotifications = true;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      BackgroundModeEnabled = false;
      BookmarkBarEnabled = false;
      BrowserAddPersonEnabled = true;
      BrowserLabsEnabled = false;
      PromotionalTabsEnabled = false;
      ShoppingListEnabled = false;
      ShowFullUrlsInAddressBar = true;
      CloudReportingEnabled = false;
      CloudProfileReportingEnabled = false;
      CreateThemesSettings = 2;
      DevToolsGenAiSettings = 2;
      GenAILocalFoundationalModelSettings = 1;
      HelpMeWriteSettings = 2;
      TabOrganizerSettings = 2;
      ZstdContentEncodingEnabled = true;
      PasswordDismissCompromisedAlertEnabled = false;
      PasswordLeakDetectionEnabled = false;
      PasswordSharingEnabled = false;
      RelatedWebsiteSetsEnabled = false;
      HomePageIsNewTabPage = true;
      RestoreOnStartup = 5;
      ShowHomeButton = false;
      SafeBrowsingExtendedReportingEnabled = false;
      SafeBrowsingProtectionLevel = 0;
      SafeBrowsingProxiedRealTimeChecksAllowed = false;
      SafeBrowsingSurveysEnabled = false;
    };
  };
}
