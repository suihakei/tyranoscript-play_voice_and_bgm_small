[macro name="pv"]
; 現在の音量を取得し、変数に入れる
[if exp="f.bgmVolume === undefined"]
    [eval exp="f.bgmVolume=sf._system_config_bgm_volume"]
[endif]

; BGMのボリュームを変更（小さくする）
[bgmopt volume=30]

; ボイスの再生
[playse storage="&mp.storage" clear=true]

[iscript]
// ボイスの再生が終わったかどうかを検知し続ける
var intervalId = setInterval(function() {
    if (TYRANO.kag.tmp.is_se_play === false) {
        // ボイスの再生が終わったら検知をやめ、もとの音量にBGMを戻す
        clearInterval(intervalId);
        tyrano.plugin.kag.ftag.startTag('bgmopt', {'volume': f.bgmVolume});
        f.bgmVolume = undefined;
    }
}, 100);
[endscript]

[endmacro]
