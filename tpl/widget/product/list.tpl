[{if $products && !empty($products)}]

    [{assign var="rowCols" value="4"}]
    [{if $type == "large"}][{assign var="rowCols" value="2"}][{/if}]
    [{if count($products) < $rowCols}][{assign var="rowCols" value=$rowCols}][{/if}]

    [{if $head}]
        <div class="row">
            <span class="h3">[{$head}]</span>
            [{if $rsslink}]
                <a class="rss" id="[{$rssId}]" aria-label="RSS" href="[{$rsslink.link}]" target="_blank">
                    <i class="fas fa-rss"></i>
                </a>
            [{/if}]
            [{if $subhead}]
                <small class="subhead">[{$subhead}]</small>
            [{/if}]
        </div>
    [{/if}]
    <div class="row row-cols-sm-1 row-cols-md-2 row-cols-lg-[{$rowCols}] g-3">
        [{foreach from=$products item="_product" name="productlist"}]
            <div class="col">
                [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() iLinkType=$_product->getLinkType() _object=$_product anid=$_product->getId() sWidgetType=product sListType=listitem_$type blDisableToCart=$blDisableToCart isVatIncluded=$oView->isVatIncluded() showMainLink=$showMainLink}]
            </div>

        [{/foreach}]
    </div>
[{/if}]