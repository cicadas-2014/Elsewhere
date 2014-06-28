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

        console.log(data);

        // Initiate the chart
        $('#container').highcharts('Map', {


            mapNavigation: {
                enabled: true,
                buttonOptions: {
                    verticalAlign: 'bottom'
                }
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
                tooltip: {
                    valueSuffix: ' likes'
                }
            }]

        });

        $('g.highcharts-series-group .highcharts-series path').on('click', function(e) {
                e.preventDefault();
                var target = $( event.target );
                var split_route = $(target).attr("class").split(' ');
                var route = split_route[1].split('-')
                var final_route = route[2]
                var request = $.ajax({
                    url: '/'+ final_route,
                    type: 'get',
                    data: {country_sting: $(target).attr("class")}
                });

                request.done(function(response) {
                    console.log(response);
                })
            })
    });

});

$(".map").click(function(event) {
    console.log("hello");
        // alert(event.target.id+" and "+event.target.class);
    });

});
