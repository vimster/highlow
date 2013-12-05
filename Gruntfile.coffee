module.exports = (grunt) ->

  grunt.initConfig
    watch:
      coffee:
        files: ['client/js/**/*.coffee']
        tasks: 'coffeeify'
      less:
        files: ['client/less/**/*.less']
        tasks: 'less:compile'

    nodemon:
      server:
        options:
          file: 'server'
          watchedExtensions: ['coffee']
          watchedFolders: ['server', 'app']
          debug: true
          delayTime: 1

    concurrent:
      tasks: ['nodemon', 'watch']
      options:
        logConcurrentOutput: true

    mochaTest:
      test:
        options:
          reporter: 'spec'
          timeout: 2*60*1000
          require: 'coffee-script'
        src: ['test/**/*.coffee']

    coffeeify:
      options:
        debug: true
      files:
        src: 'server/js/main.coffee',
        dest: 'server/public/js/main.js'

    less:
      compile:
        options:
          paths: ["client/css"]
        files:
          [{
            expand: true
            cwd: 'client/less'
            src: ['*.less']
            dest: 'server/public/css'
            ext: '.css'
          }]

  # load all grunt tasks
  require('matchdep').filterDev('grunt-*').forEach grunt.loadNpmTasks

  grunt.registerTask 'default', ['coffeeify', 'less:compile', 'concurrent']
  grunt.registerTask 'test', 'mochaTest'

