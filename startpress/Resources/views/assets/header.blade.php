@if($styles)
    @foreach($styles as $assetName => $style)
        {!! StartPress::getAssetBuilder()->addAsset($style, $assetName, 'css') !!}
    @endforeach
@endif
@if($headScripts)
    @foreach($headScripts as $assetName => $script)
        {!! StartPress::getAssetBuilder()->addAsset($script, $assetName, 'js') !!}
    @endforeach
@endif
