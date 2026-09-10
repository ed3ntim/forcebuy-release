function e(t){return t?t.startsWith("/api/")?t:t.startsWith("http")?`/api/images/remote?url=${encodeURIComponent(t)}`:`/api/images/steam?icon=${encodeURIComponent(t)}`:null}export{e as i};
