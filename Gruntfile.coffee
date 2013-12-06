module.exports = (grunt) ->

  clientDir =  "client/"
  publicDir = "server/public/"

  grunt.initConfig

    buildTempDir: "build/tmp/"
    modules: "<%= buildTempDir %>src/"


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
        src: 'client/js/app.coffee',
        dest: publicDir + 'js/main.js'

    clean:
      dist: [
        publicDir + 'js'
        publicDir + 'css'
        publicDir + 'libs'
      ]

    copy:
      libs:
        files: [
          expand: true, cwd: 'client/libs', src: ['**'], dest: publicDir + 'libs'
        ]

    less:
      compile:
        options:
          paths: ["client/css"]
        files:
          [{
            expand: true
            cwd: clientDir + 'less'
            src: ['*.less']
            dest: publicDir + 'css'
            ext: '.css'
          }]

  # load all grunt tasks
  require('matchdep').filterDev('grunt-*').forEach grunt.loadNpmTasks

  grunt.registerTask 'compile', ['clean', 'copy', 'coffeeify', 'less']
  grunt.registerTask 'default', ['compile', 'concurrent']
  grunt.registerTask 'test', 'mochaTest'

