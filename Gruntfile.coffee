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

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-watch')

  grunt.registerTask('default', ['coffee', 'watch'])

