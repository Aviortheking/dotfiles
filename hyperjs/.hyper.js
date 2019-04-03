module.exports = {
  config: {

    updateChannel: 'stable',

    fontSize: 18,

    fontFamily: '"Fira Code", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

    fontWeight: 'normal',

    fontWeightBold: 'bold',

    lineHeight: 1,

    letterSpacing: 0,

    cursorColor: 'rgba(255,255,255,0.8)',

    cursorAccentColor: '#000',

    cursorShape: 'BLOCK',

    cursorBlink: true,

    foregroundColor: '#fff',

    backgroundColor: '#313131',

    selectionColor: 'rgba(255,255,255,0.3)',

    borderColor: '#333',

    css: '',

    termCSS: '',

    showHamburgerMenu: false,

    showWindowControls: '',

    padding: '12px 14px',

    colors: {
      black: '#000000',
      red: '#C51E14',
      green: '#1DC121',
      yellow: '#C7C329',
      blue: '#0A2FC4',
      magenta: '#C839C5',
      cyan: '#20C5C6',
      white: '#C7C7C7',
      lightBlack: '#686868',
      lightRed: '#FD6F6B',
      lightGreen: '#67F86F',
      lightYellow: '#FFFA72',
      lightBlue: '#6A76FB',
      lightMagenta: '#FD7CFC',
      lightCyan: '#68FDFE',
      lightWhite: '#FFFFFF',
    },

    MaterialTheme: {
      theme: 'Darker'
    },

    hyperline: {
      plugins: [
        "hostname",
        "ip",
        "memory",
        "battery",
        "cpu",
        "network"
      ]

    },

    shell: '',

    shellArgs: ['--login'],

    env: {},

    bell: 'SOUND',

    copyOnSelect: false,

    defaultSSHApp: true,

    summon: {
      hideDock: true,
      hideOnBlur: true,
      hotkey: 'F12',
    }
  },

plugins: [
    "hyperline",
    "hyperterm-summon",
    "hyperminimal",
    "hyper-material-theme",
    "hyper-font-ligatures"
  ],

  keymaps: {},
};
