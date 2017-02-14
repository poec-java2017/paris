module.exports = function(grunt){

    // Project configuration
    grunt.initConfig({
        pkg: grunt.file.readJSON("package.json"),

        concat: {
            css: {
                options: {
                    stripBanners: true,
                    banner: '/* <%= pkg.name %> - v<%= pkg.version %> - <%= grunt.template.today("yyyy-mm-dd") %> */\n'
                },
                files: {
                    'src/build/static/css/default.css': [
                        'src/public/static/css/generics.css',
                        'src/public/static/css/default.css'
                    ],
                    'src/build/static/css/modal.css': [
                        'src/public/static/css/modal/bet.css',
                        'src/public/static/css/modal/refill-payback.css'
                    ],
                    'src/build/static/css/refactor.css': [
                        'src/public/static/css/inscription.css'
                    ]
                }
            }
        },

        cssmin: {
            target: {
                files:[{
                    expand:true,
                    cwd:'src/build/static/css',
                    src: ['*.css', '!*.min.css'],
                    dest:'src/build/static/css',
                    ext:'.min.css'
                }]
            }
        },

        watch: {
            css: {
                files: [
                    'src/public/static/css/generics.css',
                    'src/public/static/css/default.css',
                    'src/public/static/css/modal/*.css'
                ],
                tasks:['concat:css', 'cssmin']
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-watch');

    grunt.registerTask('default', ['concat', 'cssmin']);
    grunt.registerTask('dev', ['watch']);
}