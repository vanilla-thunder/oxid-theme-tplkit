[{assign var="cl" value=$oViewConf->getTopActionClassName()}]
<li class="nav-item">
    <a class="nav-link [{if $cl == "start"}]active[{/if}]" aria-current="page" href="[{$oViewConf->getHomeLink()}]">[{oxmultilang ident="HOME"}]</a>
</li>
[{if $oxcmp_categories}]
    [{block name="navbar_categories"}]

        [{*
        [{foreach from=$oxcmp_categories item="oRootCat" key="catkey" name="rootcats"}]
            [{if $oRootCat->getIsVisible()}]
                <li class="nav-item [{if $oRootCat->getSubCats()}]dropdown[{/if}]">
                    <a class="nav-link dropdown-toggle" href="[{$oRootCat->getLink()}]">[{$oRootCat->oxcategories__oxtitle->value}]</a>
                    [{if $oRootCat->getSubCats()}]
                        <ul class="dropdown-menu" aria-labelledby="categoriesDropdown">
                            [{foreach from=$oRootCat->getSubCats() item="oSubCat" key="subcatkey" name="subcats"}]
                                [{if $oSubCat->getIsVisible()}]
                                    <li><a class="dropdown-item" href="[{$oSubCat->getLink()}]">[{$oSubCat->oxcategories__oxtitle->value}]</a></li>
                                [{/if}]
                            [{/foreach}]
                        </ul>
                    [{/if}]
                </li>
            [{/if}]
        [{/foreach}]
        *}]
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle [{if $cl == 'alist'}]active[{/if}]" id="categoriesDropdown" role="button" data-toggle="dropdown" aria-expanded="false" href="#">Kategorien</a>
            <ul class="dropdown-menu" aria-labelledby="categoriesDropdown">
                [{foreach from=$oxcmp_categories item="oRootCat" key="catkey" name="rootcats"}]
                    [{if $oRootCat->getIsVisible()}]
                        <li><a class="dropdown-item" href="[{$oRootCat->getLink()}]">[{$oRootCat->oxcategories__oxtitle->value}]</a></li>
                        [{if $oRootCat->getSubCats()}]
                            [{foreach from=$oRootCat->getSubCats() item="oSubCat" key="subcatkey" name="subcats"}]
                                [{if $oSubCat->getIsVisible()}]
                                    <li><a class="dropdown-item" href="[{$oSubCat->getLink()}]">&nbsp;&nbsp;&nbsp;&nbsp;[{$oSubCat->oxcategories__oxtitle->value}]</a></li>
                                [{/if}]
                            [{/foreach}]
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                        [{/if}]
                    [{/if}]
                [{/foreach}]
            </ul>
        </li>
    [{/block}]
[{/if}]


[{*
<nav id="mainnav" class="navbar navbar-expand-lg navbar-light[{if $blFullwidth}] fullviewlayout[{/if}]" role="navigation">
    <div class="container">
    [{block name="dd_widget_header_categorylist_navbar"}]
        [{block name="dd_widget_header_categorylist_navbar_header"}]
            <div class="navbar-header justify-content-start">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-main-collapse" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <span class="d-lg-none">[{oxmultilang ident="DD_ROLES_BEMAIN_UIROOTHEADER"}]</span>
            </div>
        [{/block}]
        <div class="collapse navbar-collapse navbar-main-collapse" id="navbarSupportedContent">
            <ul id="navigation" class="navbar-nav nav">
                [{block name="dd_widget_header_categorylist_navbar_list"}]
                    [{if $oViewConf->getViewThemeParam('blHomeLink')}]
                        <li class="nav-item[{if $homeSelected == 'true'}] active[{/if}]">
                            <a class="nav-link" href="[{$oViewConf->getHomeLink()}]">[{oxmultilang ident="HOME"}]</a>
                        </li>
                    [{/if}]

                    [{foreach from=$oxcmp_categories item="ocat" key="catkey" name="root"}]
                        [{if $ocat->getIsVisible()}]
                            [{foreach from=$ocat->getContentCats() item="oTopCont" name="MoreTopCms"}]
                                <li class="nav-item">
                                    <a class="nav-link[{if $oContent->oxcontents__oxloadid->value === $oTopCont->oxcontents__oxloadid->value}] active[{/if}]" href="[{$oTopCont->getLink()}]">[{$oTopCont->oxcontents__oxtitle->value}]</a>
                                </li>
                            [{/foreach}]

                            <li class="nav-item[{if $homeSelected == 'false' && $ocat->expanded}] active[{/if}][{if $ocat->getSubCats()}] dropdown[{/if}]">
                                <a class="nav-link" href="[{$ocat->getLink()}]"[{if $ocat->getSubCats()}] class="dropdown-toggle" data-toggle="dropdown"[{/if}]>
                                    [{$ocat->oxcategories__oxtitle->value}][{if $ocat->getSubCats()}] <i class="fa fa-angle-down"></i>[{/if}]
                                </a>

                                [{if $ocat->getSubCats()}]
                                    <ul class="dropdown-menu">
                                        [{foreach from=$ocat->getSubCats() item="osubcat" key="subcatkey" name="SubCat"}]
                                            [{if $osubcat->getIsVisible()}]
                                                [{foreach from=$osubcat->getContentCats() item=ocont name=MoreCms}]
                                                    <li class="dropdown-item[{if $oViewConf->getContentId() == $ocont->getId()}] active[{/if}]">
                                                        <a class="dropdown-link[{if $oViewConf->getContentId() == $ocont->getId()}] current[{/if}]" href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a>
                                                    </li>
                                                [{/foreach}]

                                                [{if $osubcat->getIsVisible()}]
                                                    <li class="dropdown-item[{if $homeSelected == 'false' && $osubcat->expanded}] active[{/if}]">
                                                        <a class="dropdown-link[{if $homeSelected == 'false' && $osubcat->expanded}] current[{/if}]" href="[{$osubcat->getLink()}]">[{$osubcat->oxcategories__oxtitle->value}]</a>
                                                    </li>
                                                [{/if}]
                                            [{/if}]
                                        [{/foreach}]
                                    </ul>
                                [{/if}]
                            </li>
                        [{/if}]
                    [{/foreach}]
                [{/block}]
            </ul>

            <ul class="fixed-header-actions">

                [{block name="categorylist_navbar_minibasket"}]
                    [{include file="widget/header/menubasket.tpl"}]
                [{/block}]

                <li class="fixed-header-item">
                    <a href="javascript:void(null)" class="search-toggle fixed-header-link" rel="nofollow">
                        <i class="fa fa-search"></i>
                    </a>
                </li>

            </ul>

            [{if $oView->isDemoShop()}]

                <a href="[{$oViewConf->getBaseDir()}]admin/" class="btn btn-sm btn-danger navbar-btn navbar-right visible-lg">
                    [{oxmultilang ident="DD_DEMO_ADMIN_TOOL"}]
                    <i class="fa fa-external-link" style="font-size: 80%;"></i>
                </a>

            [{/if}]

        </div>
    [{/block}]
    </div>
</nav>
*}]

