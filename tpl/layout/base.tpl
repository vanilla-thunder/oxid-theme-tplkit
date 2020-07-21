<!DOCTYPE html>
<html lang="[{$oView->getActiveLangAbbr()}]" [{block name="head_html_namespace"}][{/block}]>
    <head>
        [{strip}]
            [{* scripts and styles *}]
            [{if $oShop->oxshops__oxproductive->value}]
                [{oxstyle include="css/bootstrap.min.css"}]
                [{oxstyle include="css/styles.min.css"}]

                [{oxscript include="js/bootstrap.bundle.min.js" priority=1}]
            [{else}]
                [{oxstyle include="css/bootstrap.css"}]
                [{oxstyle include="css/styles.css"}]

                [{oxscript include="js/bootstrap.bundle.js" priority=1}]
            [{/if}]

            <meta charset="[{$oView->getCharSet()}]">
            <meta name="viewport" content="width=device-width, initial-scale=1">

            [{assign var=sPageTitle value=$oView->getPageTitle()}]
            <title>[{block name="head_title"}][{$sPageTitle}][{/block}]</title>

            [{block name="head_meta_robots"}]
                [{if $oView->noIndex() == 1}]
                    <meta name="ROBOTS" content="NOINDEX, NOFOLLOW">
                [{elseif $oView->noIndex() == 2}]
                    <meta name="ROBOTS" content="NOINDEX, FOLLOW">
                [{/if}]
            [{/block}]

            [{block name="head_meta_description"}]
                [{if $oView->getMetaDescription()}]
                    <meta name="description" content="[{$oView->getMetaDescription()}]">
                [{/if}]
            [{/block}]

            [{block name="head_meta_keywords"}]
                [{if $oView->getMetaKeywords()}]
                    <meta name="keywords" content="[{$oView->getMetaKeywords()}]">
                [{/if}]
            [{/block}]

            [{block name="head_meta_open_graph"}]
                <meta property="og:site_name" content="[{$oViewConf->getBaseDir()}]">
                <meta property="og:title" content="[{$sPageTitle}]">
                <meta property="og:description" content="[{$oView->getMetaDescription()}]">
                [{if $oViewConf->getActiveClassName() == 'details'}]
                    <meta property="og:type" content="product">
                    <meta property="og:image" content="[{$oView->getActPicture()}]">
                    <meta property="og:url" content="[{$oView->getCanonicalUrl()}]">
                [{else}]
                    <meta property="og:type" content="website">
                    <meta property="og:image" content="[{$oViewConf->getImageUrl('basket.png')}]">
                    <meta property="og:url" content="[{$oViewConf->getCurrentHomeDir()}]">
                [{/if}]
            [{/block}]

            [{assign var="canonical_url" value=$oView->getCanonicalUrl()}]
            [{block name="head_link_canonical"}]
                [{if $canonical_url}]
                    <link rel="canonical" href="[{$canonical_url}]">
                [{/if}]
            [{/block}]

            [{block name="head_link_hreflang"}]
                [{if $oView->isLanguageLoaded()}]
                    [{assign var="oConfig" value=$oViewConf->getConfig()}]
                    [{foreach from=$oxcmp_lang item=_lng}]
                        [{if $_lng->id == $oConfig->getConfigParam('sDefaultLang')}]
                            <link rel="alternate" hreflang="x-default" href="[{$_lng->link}]"/>
                        [{/if}]
                        <link rel="alternate" hreflang="[{$_lng->abbr}]" href="[{$_lng->link|oxaddparams:$oView->getDynUrlParams()}]"/>
                    [{/foreach}]
                [{/if}]
            [{/block}]

            [{assign var="oPageNavigation" value=$oView->getPageNavigation()}]
            [{if $oPageNavigation}]
                [{if $oPageNavigation->previousPage}]
                    <link rel="prev" href="[{$oPageNavigation->previousPage}]">
                [{/if}]
                [{if $oPageNavigation->nextPage}]
                    <link rel="next" href="[{$oPageNavigation->nextPage}]">
                [{/if}]
            [{/if}]

            [{block name="head_link_favicon"}][{/block}]

            [{block name="base_style"}][{/block}]

            [{block name="base_fonts"}][{/block}]

            [{assign var='rsslinks' value=$oView->getRssLinks()}]
            [{block name="head_link_rss"}]
                [{if $rsslinks}]
                    [{foreach from=$rsslinks item='rssentry'}]
                        <link rel="alternate" type="application/rss+xml" title="[{$rssentry.title|strip_tags}]" href="[{$rssentry.link}]">
                    [{/foreach}]
                [{/if}]
            [{/block}]

            [{block name="head_css"}]
                [{foreach from=$oxidBlock_head item="_block"}]
                    [{$_block}]
                [{/foreach}]
            [{/block}]
        [{/strip}]
        [{oxstyle}]

        [{if $sStyle}]
            <style>
                body {
                    [{$sStyle}]
                }
            </style>
        [{/if}]
    </head>

    [{assign var="blIsCheckout" value=$oView->getIsOrderStep()}]
    <body class="cl-[{$oView->getClassName()}][{if $smarty.get.plain == '1'}] popup[{/if}][{if $blIsCheckout}] is-checkout[{/if}][{if $oxcmp_user && $oxcmp_user->oxuser__oxpassword->value}] is-logged-in[{/if}]">

    [{foreach from=$oxidBlock_pageBody item="_block"}]
        [{$_block}]
    [{/foreach}]

    [{if $oViewConf->getTopActiveClassName() == 'details' && $oView->showZoomPics()}]
        [{include file="page/details/inc/photoswipe.tpl"}]
    [{/if}]

    [{block name="base_js"}]
        [{include file="i18n/js_vars.tpl"}]
    [{/block}]

    [{oxscript}]

    [{if !$oView->isDemoShop()}]
        [{oxid_include_dynamic file="widget/dynscript.tpl"}]
    [{/if}]

    [{foreach from=$oxidBlock_pageScript item="_block"}]
        [{$_block}]
    [{/foreach}]
    </body>
</html>
