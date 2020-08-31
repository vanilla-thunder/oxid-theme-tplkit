[{assign var="product" value=$oView->getProduct()}]
<div class="card h-100">
    <a href="[$product->getMainLink()}]" title="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
        <img src="[{$product->getThumbnailUrl()}]" class="card-img-top mx-auto d-block" alt="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
    </a>
    <div class="card-body">
        <a href="[{$product->getMainLink()}]">
            <h5 class="card-title">[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]</h5>
            <p class="card-text">[{$product->oxarticles__oxshortdesc->value}]</p>
        </a>
    </div>
</div>