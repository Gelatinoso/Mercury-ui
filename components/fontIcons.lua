local utf8 = require "utf8"

return {
    search = utf8.char(0xe800),
    ok = utf8.char(0xe801),
    cancel = utf8.char(0xe804),
    attention = utf8.char(0xe802),
    attentionCircled = utf8.char(0xe803),
    folderOpen = utf8.char(0xe805),
    folder = utf8.char(0xe806),
    cogAlt = utf8.char(0xe807),
    cog = utf8.char(0xe808),
    toggleOff = utf8.char(0xf204),
    toggleOn = utf8.char(0xf205),
    code = utf8.char(0xf121),
    linux = utf8.char(0xf17C),
    windows = utf8.char(0xf17a),
    github = utf8.char(0xf09b),
    download = utf8.char(0xe809)
}
