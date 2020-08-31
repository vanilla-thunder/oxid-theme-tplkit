[{if $oView->showSearch()}]
    <form id="searchForm" role="form" action="[{$oViewConf->getSelfActionLink()}]" method="get" name="search">
        [{$oViewConf->getHiddenSid()}]
        <input type="hidden" name="cl" value="search">

        [{block name="widget_header_search_input"}]
            <input type="text" name="searchparam" id="searchParam" class="form-control mr-2" value="[{$oView->getSearchParamForHtml()}]" placeholder="[{oxmultilang ident="SEARCH"}]" aria-label="[{oxmultilang ident="SEARCH"}]">
        [{/block}]
        [{block name="widget_header_search_button"}]
            <button type="submit" id="searchSubmit" class="btn btn-outline-secondary" title="[{oxmultilang ident="SEARCH_SUBMIT"}]">[{oxmultilang ident="SEARCH_SUBMIT"}]</button>
        [{/block}]
    </form>
[{/if}]
