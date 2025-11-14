{
  programs.chromium = {
    enable = true;
    defaultSearchProviderEnabled = true;
    defaultSearchProviderSearchURL = "https://www.google.com/search?q={searchTerms}&{google:RLZ}{google:originalQueryForSuggestion}{google:assistedQueryStats}{google:searchFieldtrialParameter}{google:searchClient}{google:sourceId}{google:instantExtendedEnabledParameter}ie={inputEncoding}";
    defaultSearchProviderSuggestURL = "https://www.google.com/complete/search?output=chrome&q={searchTerms}";
    extraOpts = {
      AIModeSettings = 0;
      CreateThemesSettings = 2;
      GeminiActOnWebSettings = 1;
      HistorySearchSettings = 2;
      TabOrganizerSettings = 2;
      AutofillPredictionSettings = 2;
      DevToolsGenAiSettings = 2;
      GeminiSettings = 1;
      GenAILocalFoundationalModelSettings = 1;
      GenAiDefaultSettings = 1;
      HelpMeWriteSettings = 2;
      TabCompareSettings = 2;

      PasswordManagerEnabled = false;
      PasswordSharingEnabled = false;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;

      BrowserSignin = 0;
      SyncDisabled = true;

      SpellcheckEnabled = false;
      SpellCheckServiceEnabled = false;
      HideWebStoreIcon = true;
      AllowSystemNotifications = true;
      BackgroundModeEnabled = false;
      BookmarkBarEnabled = false;
      BrowserAddPersonEnabled = false;
      BrowserLabsEnabled = false;
      PromotionalTabsEnabled = false;
      ShoppingListEnabled = false;
      ShowFullUrlsInAddressBar = true;
      HomePageIsNewTabPage = true;
      RestoreOnStartup = 5;
      ShowHomeButton = true;

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
