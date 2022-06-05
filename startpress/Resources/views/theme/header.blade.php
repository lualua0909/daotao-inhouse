@if($styles)
    @foreach($styles as $assetName => $style)
        {!! StartPress::getAssetBuilder()->addAsset($style, $assetName, 'css', true) !!}
    @endforeach
@endif
@if($headScripts)
    @foreach($headScripts as $assetName => $script)
        {!! StartPress::getAssetBuilder()->addAsset($script, $assetName, 'js', true) !!}
    @endforeach
@endif
