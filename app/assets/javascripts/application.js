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
            backgroundColor: 'white'
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

        console.log(data);

        // Initiate the chart
        $('#container').highcharts('Map', {


            mapNavigation: {
                enabled: true,
                buttonOptions: {
                    verticalAlign: 'bottom'
                }
            },


        colorAxis: {
            min: 1,
            max: 1000,
            type: 'logarithmic'
        },

        legend: {
            title: {
                    // text: 'Population density (/km²)'
                }
            },

            plotOptions: {
                series: {
                    cursor: 'pointer',
                    events: {
                        click: function(event) {
                            console.log(event.point.name);
                            $("#search").val(event.point.name);
                            $("#searchbutton").click();
                        }
                    }
                }
            },

            series : [{
                data : data,
                mapData: Highcharts.maps['custom/world'],
                joinBy: ['iso-a2', 'code'],
                name: 'Travel Info',
                // tooltip: {
                //     valueSuffix: ' likes'
                // }
            }]
        });

});

$(".map").click(function(event) {
    console.log("hello");
        // alert(event.target.id+" and "+event.target.class);
    });

});
