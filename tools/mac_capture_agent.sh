#!/bin/bash
#
#  mac_capture_agent.sh — Mac side 常駐 agent
#
#  ユーザが 1 回 Mac Terminal で実行すると常駐する。
#  SSH から trigger file を touch するだけで screencapture が走る。
#
#  使い方 (Mac ターミナルで 1 度だけ):
#    bash mac_capture_agent.sh
#
#  SSH 側からは:
#    ssh mac 'touch /tmp/mac_cap_req_<tag>'
#    # wait then
#    scp mac:/tmp/mac_cap_<tag>.png ./
#
#  停止は Ctrl-C。
#
REQ_DIR=/tmp
SHOT_DIR=/tmp

echo "[agent] started. trigger files: ${REQ_DIR}/mac_cap_req_*"
echo "[agent] SSH 側から 'touch ${REQ_DIR}/mac_cap_req_<tag>' でキャプチャ"
echo "[agent] 出力: ${SHOT_DIR}/mac_cap_<tag>.png"

while :; do
    for req in ${REQ_DIR}/mac_cap_req_*; do
        [ -e "$req" ] || continue
        tag=$(basename "$req" | sed 's/^mac_cap_req_//')
        out="${SHOT_DIR}/mac_cap_${tag}.png"
        #  active window (なら -o で一番手前のウィンドウ)。デフォルトは画面全体
        /usr/sbin/screencapture -x "$out"
        echo "[agent] captured $out"
        rm -f "$req"
    done
    sleep 0.3
done
