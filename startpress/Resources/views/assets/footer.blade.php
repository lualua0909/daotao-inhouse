@if($bodyScripts)
    @foreach($bodyScripts as $assetName => $script)
        {!! StartPress::getAssetBuilder()->addAsset($script, $assetName, 'js') !!}
    @endforeach
@endif
