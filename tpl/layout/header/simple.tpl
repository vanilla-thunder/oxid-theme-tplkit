[{if $oViewConf->getTopActionClassName() != 'clearcookies' && $oViewConf->getTopActionClassName() != 'mallstart'}]
    [{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
[{/if}]
[{block name="header_main"}]
    <header id="header" class="shadow p-1 mb-4">
        <div class="container">
            <div class="row">
                <div class="col-md">
                    [{block name="layout_header_left"}]
                        [{assign var="slogoImg" value=$oViewConf->getViewThemeParam('sLogoFile')}]
                        [{assign var="sLogoWidth" value=$oViewConf->getViewThemeParam('sLogoWidth')}]
                        [{assign var="sLogoHeight" value=$oViewConf->getViewThemeParam('sLogoHeight')}]
                        <a href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
                            <img src="[{$oViewConf->getImageUrl($slogoImg)}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]"
                                 style="[{if $sLogoWidth}]width:auto;max-width:[{$sLogoWidth}]px;[{/if}][{if $sLogoHeight}]height:auto;max-height:[{$sLogoHeight}]px;[{/if}]">
                        </a>
                    [{/block}]
                </div>
                <div class="col-md">
                    [{block name="layout_header_right"}]
                        <div class="menu-dropdowns pull-right">
                            [{block name="dd_layout_page_header_icon_menu_languages"}]
                                [{* Language Dropdown*}]
                                [{oxid_include_widget cl="oxwLanguageList" lang=$oViewConf->getActLanguageId() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
                            [{/block}]
                            [{block name="dd_layout_page_header_icon_menu_currencies"}]
                                [{* Currency Dropdown*}]
                                [{oxid_include_widget cl="oxwCurrencyList" cur=$oViewConf->getActCurrency() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
                            [{/block}]

                            [{block name="dd_layout_page_header_icon_menu_account"}]
                                [{if $oxcmp_user || $oView->getCompareItemCount() || $Errors.loginBoxErrors}]
                                    [{assign var="blAnon" value=0}]
                                    [{assign var="force_sid" value=$oViewConf->getSessionId()}]
                                [{else}]
                                    [{assign var="blAnon" value=1}]
                                [{/if}]
                                [{* Account Dropdown *}]
                                [{oxid_include_widget cl="oxwServiceMenu" _parent=$oView->getClassName() force_sid=$force_sid nocookie=$blAnon _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
                            [{/block}]

                            [{block name="dd_layout_page_header_icon_menu_minibasket"}]
                                [{* Minibasket Dropdown *}]
                                [{if $oxcmp_basket->getProductsCount()}]
                                    [{assign var="blAnon" value=0}]
                                    [{assign var="force_sid" value=$oViewConf->getSessionId()}]
                                [{else}]
                                    [{assign var="blAnon" value=1}]
                                [{/if}]
                                [{oxid_include_widget cl="oxwMiniBasket" nocookie=$blAnon force_sid=$force_sid}]
                            [{/block}]
                        </div>
                    [{/block}]
                </div>
            </div>

            [{block name="layout_header_navbar"}]
                <nav class="navbar navbar-expand-lg navbar-light">
                    <div class="container-fluid">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                                aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto mb-2 mb-lg-0">

                                [{block name="layout_header_navbar_categories"}]
                                    [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() sWidgetType="header" _parent=$oView->getClassName() nocookie=1}]
                                [{/block}]

                                [{block name="layout_header_navbar_manufacturers"}]
                                    [{if $oView->getManufacturerlist()}]
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle [{if $cl == 'manufacturerlist'}]active[{/if}]" id="manufacturersDropdown" role="button" data-toggle="dropdown"
                                               aria-expanded="false" href="#">[{oxmultilang ident="ALL_BRANDS"}]</a>
                                            <ul class="dropdown-menu" aria-labelledby="manufacturersDropdown">
                                                [{foreach from=$oView->getManufacturerlist() item="oManufacturer" key="mankey" name="manufacturers"}]
                                                    <!-- [{$oManufacturer|@var_dump}] -->
                                                    <li><a class="dropdown-item" href="[{$oManufacturer->getLink()}]">[{$oManufacturer->oxmanufacturers__oxtitle->value}]</a></li>
                                                [{/foreach}]
                                            </ul>
                                        </li>
                                    [{/if}]
                                [{/block}]

                            </ul>
                            <form class="d-flex">
                                [{block name="layout_header_right"}]
                                    [{include file="widget/header/search.tpl"}]
                                [{/block}]
                            </form>
                        </div>
                    </div>
                </nav>
            [{/block}]

        </div>
    </header>
[{/block}]

[{insert name="oxid_newbasketitem" tpl="widget/minibasket/newbasketitemmsg.tpl" type="message"}]
[{oxid_include_dynamic file="widget/minibasket/minibasketmodal.tpl"}]