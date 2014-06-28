//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function () {
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
                name: 'Country'
            }]

        });

    });

});

$(".map").click(function(event) {
    console.log("hello");
        // alert(event.target.id+" and "+event.target.class);
    });

