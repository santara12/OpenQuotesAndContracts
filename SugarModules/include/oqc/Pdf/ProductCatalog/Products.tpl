
\textbf{\ref{categoryId<$category.id|replace:"-":"">}} & \multicolumn{2}{p{0.7\textwidth}}{\textbf{<$category.name>}} & \setcounter{oqc_pn}{0} \\
\midrule

<if !empty($category.products)>
<foreach from=$category.products item=product name=products>
\addtocounter{oqc_pn}{1}\ref{categoryId<$category.id|replace:"-":"">}.\alph{oqc_pn}&
<$product.name><if !empty($product.image_url)> (see image \ref{productImage<$product.id|replace:"-":"">} on page \pageref{productImage<$product.id|replace:"-":"">})</if>&
<$product.unit>& 
<$currency.currency_symbol><sugar_currency_format var=$product.price*$currency.currency_ratio*$discount round=true decimals=2 currency_symbol=false>\\
<if !empty($product.options)>
<include file="include/oqc/Pdf/ProductCatalog/Options.tpl" product=$product>
</if>	
</foreach>
\midrule	
</if>
<if isset($category.subCategories) && not empty($category.subCategories)>
<foreach from=$category.subCategories item=subCategory>		
<include file="include/oqc/Pdf/ProductCatalog/Products.tpl" category=$subCategory header=true>
</foreach>
</if>
