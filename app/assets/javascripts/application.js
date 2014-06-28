//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function () {

    // this updates the main image source whenever a thumbnail image is clicked    
    $('div.show_images').on('click', 'img.thumbnail', function(e) {
        e.preventDefault();
        var new_image_source = e.target.getAttribute('src').replace("_q.jpg", "_z.jpg")
        $('img#main_image').attr('src', new_image_source);
    });

    Highcharts.setOptions({
        chart: {
            backgroundColor: 'white',
            height: 800,
            width: 1400
        },
        title: {
            style: {
                color: 'white'
            }
        },
        legend: {
            title: {
                style: {
                    color: 'silver'
                }
            }
        },
        colorAxis: {
            minColor: '#FFEFD5',
            maxColor: '#8B4513'
        }

    });

    $.getJSON('http://www.highcharts.com/samples/data/jsonp.php?filename=world-population-density.json&callback=?',
function (data) {

        // Initiate the chart
        $('#container').highcharts('Map', {


            mapNavigation: {
                enabled: true,
                buttonOptions: {
                    verticalAlign: 'bottom'
                }
            },


            legend: {
                enabled: false
            },

        //     chart: {
        //     events: {
        //         click: function(event) {
        //             alert ('x: '+ event.xAxis[0].value +', y: '+
        //                   event.yAxis[0].value);
        //         }

        //     }
        // },


        colorAxis: {
            min: 1,
            max: 1000,
            type: 'logarithmic',
            minColor: '#EEEEFF',
            maxColor: '#000022',
        },


            plotOptions: {
                series: {
                    cursor: 'pointer',
                    events: {
                        click: function(event) {
                            console.log(event.point.code)
                            
                            $("#search").val(event.point.code);
                            $("#searchbutton").click();
                        }
                    }
                }
            },

            series : [{
                data : data,
                mapData: Highcharts.maps['custom/world'],
                joinBy: ['iso-a2', 'code'],

                name: 'Country',
                states: {
                    hover: {
                        color: '#BADA55'
                    }
                },
                tooltip: {
                pointFormat: '{point.name}'
                }



            }]

        });

    });

});

$(".map").click(function(event) {
    console.log("hello");
        // alert(event.target.id+" and "+event.target.class);
    });

