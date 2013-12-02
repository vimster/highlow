module.exports = (grunt) ->

  grunt.initConfig
    watch:
      coffee:
        files: ['public/src-cs/*.coffee']
        tasks: 'coffee'
    coffee:
      compile:
        files:
          'public/js/main.js': ['public/src-cs/*.coffee']
    express:
      serverreload: true
      livereload:
        options:
          server: 'server'
          livereload: true
          serverreload: true
          bases: ['./app']

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-closure-tools')
  grunt.loadNpmTasks('grunt-express')

  grunt.registerTask('default', ['coffee', 'watch', 'express'])

