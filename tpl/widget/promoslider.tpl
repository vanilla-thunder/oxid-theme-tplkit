[{block name="dd_widget_promoslider"}]
    [{assign var="oBanners" value=$oView->getBanners()}]
    [{assign var="currency" value=$oView->getActCurrency()}]

    [{if $oBanners|@count}]
        <div class="container">
            <div id="promoslider" class="carousel slide" data-ride="carousel">

                [{if $oViewConf->getViewThemeParam('blShowPromosliderIndicators')}]
                    [{block name="promoslider_indicators"}]
                        <ol class="carousel-indicators">
                            [{foreach from=$oBanners key="iSlideNr" item="oBanner" name="indicators"}]
                                <li data-target="#promoslider" data-slide-to="[{$smarty.foreach.indicators.index}]" [{if $smarty.foreach.indicators.first}]class="active"[{/if}]></li>
                            [{/foreach}]
                        </ol>
                    [{/block}]
                [{/if}]

                <div class="carousel-inner">
                    [{foreach from=$oBanners key="iSlideNr" item="oBanner" name="slides"}]
                        [{assign var="oArticle" value=$oBanner->getBannerArticle()}]
                        <div class="carousel-item [{if $smarty.foreach.slides.first}]active[{/if}]">
                            [{if $oBanner->getBannerLink()}]<a href="[{$oBanner->getBannerLink()}]">[{/if}]
                            <img src="[{$oBanner->getBannerPictureUrl()}]" class="d-block w-100" alt="[{$oBanner->oxactions__oxtitle->value}]">
                            <!-- [{$oBanner->getBannerLink()}] -->
                            [{block name="promoslider_caption"}]
                                [{if $oArticle}]
                                    <div class="carousel-caption d-none d-md-block">
                                        <h5>[{$oArticle->oxarticles__oxtitle->value|trim}]</h5>
                                        <p>[{$oArticle->oxarticles__oxshortdesc->value|trim}]</p>
                                    </div>
                                [{/if}]
                            [{/block}]
                                [{if $oBanner->getBannerLink()}]</a>[{/if}]
                        </div>
                    [{/foreach}]
                </div>

                [{if $oViewConf->getViewThemeParam('blShowPromosliderControls')}]
                    [{block name="promoslider_controls"}]
                        <a class="carousel-control-prev" href="#promoslider" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#promoslider" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    [{/block}]
                [{/if}]
            </div>
        </div>
    [{/if}]
[{/block}]
