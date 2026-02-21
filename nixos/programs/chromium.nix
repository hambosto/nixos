{
  programs.chromium = {
    enable = true;
    defaultSearchProviderEnabled = true;
    defaultSearchProviderSearchURL = "https://www.google.com/search?q={searchTerms}&{google:RLZ}{google:originalQueryForSuggestion}{google:assistedQueryStats}{google:searchFieldtrialParameter}{google:searchClient}{google:sourceId}{google:instantExtendedEnabledParameter}ie={inputEncoding}";
    defaultSearchProviderSuggestURL = "https://www.google.com/complete/search?output=chrome&q={searchTerms}";
    extraOpts = {
      AdsSettingForIntrusiveAdsSites = 2;
      AiSettingsPageEnabled = false;
      AIModeSettings = 1;
      AlternateErrorPagesEnabled = false;
      AttributionReportingEnabled = false;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      AutofillPredictionImprovementsEnabled = false;
      AutofillPredictionImprovementsSettings = 2;
      AutofillPredictionSettings = 2;
      BackgroundModeEnabled = false;
      BlockThirdPartyCookies = true;
      BookmarkBarEnabled = false;
      BrowserAddPersonEnabled = false;
      BrowserLabsEnabled = false;
      BrowserSignin = 0;
      BrowserSwitcherEnabled = false;
      ChromeCleanupEnabled = false;
      ChromeCleanupReportingEnabled = false;
      ChromeRemoteDesktopReportingEnabled = false;
      CloudManagementEnrollmentMandatory = false;
      CloudPrintProxyEnabled = false;
      CloudPrintSubmitEnabled = false;
      CloudReportingEnabled = false;
      CreateThemesSettings = 2;
      DefaultBrowserSettingEnabled = false;
      DefaultFileSystemReadGuardSetting = 2;
      DefaultFileSystemWriteGuardSetting = 2;
      DefaultGeolocationSetting = 2;
      DefaultLocalFontsAccessSetting = 2;
      DefaultNotificationsSetting = 2;
      DefaultPopupsSetting = 2;
      DefaultSensorsSetting = 2;
      DefaultSerialGuardSetting = 2;
      DefaultWebBluetoothGuardSetting = 2;
      DefaultWebUsbGuardSetting = 2;
      DefaultWindowManagementSetting = 2;
      DevToolsGenAiSettings = 2;
      DnsOverHttpsMode = "off";
      EnableMediaRouter = false;
      EnterpriseRealTimeUrlCheckMode = 0;
      FirstPartySetsEnabled = false;
      FledgeEnabled = false;
      GeminiActOnWebSettings = 1;
      GeminiSettings = 1;
      GenAiDefaultSettings = 2;
      GenAILocalFoundationalModelSettings = 1;
      HeartbeatEnabled = false;
      HelpMeWriteSettings = 2;
      HideWebStoreIcon = true;
      HistorySearchSettings = 2;
      HomePageIsNewTabPage = true;
      ImportAutofillFormData = false;
      ImportBookmarks = false;
      ImportHistory = false;
      ImportHomepage = false;
      ImportSavedPasswords = false;
      ImportSearchEngine = false;
      MetricsReportingEnabled = false;
      NetworkPredictionOptions = 2;
      PasswordManagerEnabled = false;
      PasswordProtectionWarningTrigger = 0;
      PasswordSharingEnabled = false;
      PriceInsightsEnabled = false;
      PrivacySandboxAdMeasurementEnabled = false;
      PrivacySandboxAdTopicsEnabled = false;
      PrivacySandboxPromptEnabled = false;
      PrivacySandboxRelatedWebsiteSetsEnabled = false;
      PrivacySandboxSiteEnabledAdsEnabled = false;
      PromotionalTabsEnabled = false;
      PromptForDownloadLocation = true;
      RemoteAccessHostAllowEnterpriseRemoteSupportConnections = false;
      RestoreOnStartup = 5;
      SafeBrowsingDeepScanningEnabled = false;
      SafeBrowsingEnabled = false;
      SafeBrowsingExtendedReportingEnabled = false;
      SafeBrowsingExtendedReportingOptInAllowed = false;
      SafeBrowsingProtectionLevel = 0;
      SafeBrowsingProxiedRealTimeChecksAllowed = false;
      SafeSitesFilterBehavior = 0;
      SearchSuggestEnabled = false;
      ShoppingListEnabled = false;
      ShoppingPageTypes = 0;
      ShowCastIconInToolbar = false;
      ShowFullUrlsInAddressBar = true;
      ShowHomeButton = true;
      SigninAllowed = false;
      SpellcheckEnabled = false;
      SpellCheckServiceEnabled = false;
      SyncDisabled = true;
      SyncTypesListDisabled = [
        "apps"
        "autofill"
        "bookmarks"
        "extensions"
        "passwords"
        "preferences"
        "tabs"
        "themes"
        "typedUrls"
        "wifiConfigurations"
      ];
      TabCompareSettings = 2;
      TabOrganizerSettings = 2;
      AllowSystemNotifications = true;
      TranslateEnabled = false;
      UrlKeyedAnonymizedDataCollectionEnabled = false;
      UserFeedbackAllowed = false;
      WebRtcEventLogCollectionAllowed = false;

      TorDisabled = true;
      BraveRewardsDisabled = true;
      BraveWalletDisabled = true;
      BraveVPNDisabled = true;
      BraveAIChatEnabled = false;
      BraveNewsDisabled = true;
      BraveTalkDisabled = true;
      BraveSpeedreaderEnabled = false;
      BraveWaybackMachineEnabled = false;
      BraveWebDiscoveryEnabled = false;
      BravePlaylistEnabled = false;
    };
  };
}
