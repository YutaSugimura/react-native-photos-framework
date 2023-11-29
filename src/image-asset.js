import Asset from './index';

export default class ImageAsset extends Asset {
    constructor(assetObj, options) {
        super(assetObj, options);
    }

    getImageMetadata() {
        return this._fetchExtraData('getImageAssetsMetadata', 'imageMetadata');
    }
} 