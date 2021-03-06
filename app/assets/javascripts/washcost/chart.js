$( document ).ready( function()
{
  'use strict';


  function init()
  {
    $( '.report--chart' ).each( function()
    {
      var container    = $( this ),
          type         = container.data( 'chart-type' ),
          datapoints   = [],
          seed_oepy = container.data( 'chart-oepy' ),
          seed_dspy = container.data( 'chart-dspy' ),
          seed_ispy = container.data( 'chart-ispy' ),
          currency    = container.data( 'chart-currency' ),
          tech    = container.data( 'chart-tech' ),
          loan_cost    = container.data( 'chart-loancost' ),
          loan_payback    = container.data( 'chart-loanpayback' ),
          actual_hardware    = container.data( 'chart-actualhardware' ),
          system_lifespan    = container.data( 'chart-systemlifespan' ),
          legend_txt    = container.data( 'chart-legend' ),
          chart, i, j;

      if ( type == 'advanced' )
      {
        chart = new WashCostAreaChart().init(
        {
          parent: $( this )[0],
          id: 'washcostSustainChart',
          dimensions: { width:container.width(), height:container.height() },
          padding:{ top:10, right:40, bottom:60, left:140 },
          axisTypes:{ x:'linear', y:'linear', z:null },
          tickFormatters:{ y:function( d ) { return currency + ' ' + d; } },
          yAxisTitle: legend_txt[5],
          xAxisTitle: legend_txt[6],
          lineStrokeDash:[ 5, 5 ],
          hideAxes:false,
          lockAxesToZero:false,
          xAxisStyle:{ hide:false, tickTextSize:'12px', textWeight:300, textColour:'#797979', titleColour:'#333333', tickColour:'', tickSize:6, tickPadding:8, tickCount:30, textFamily:'Helvetica', lineColour:'transparent', renderSymbol:false, renderGridLines:true },
          yAxisStyle:{ hide:false, tickTextSize:'12px', textColour:'#797979', titleColour:'#333333', tickColour:'', tickSize:0, tickCount:4, textFamily:'Helvetica', lineColour:'transparent', renderSymbol:false, renderGridLines:false },
          gridLineStyle:{ colour: 'rgba(0,0,0,0.1)', dashArray:[ ] },
          shouldScrub:false,
          yPadding:0.3,
          primaryAnimationDuration:1,
          secondaryAnimationDuration:700,
          dataAccessors:{ x:function( d ){ return d.year; }, y:function( d ){ return d.cost; } }
        } );

        var chartObjects = [];
        var legend = '<ul class="legend">';

        if (seed_oepy != null) {
          var operation_expenditure_per_year = [];

          for ( i = 0; i < 30; i++ )
            operation_expenditure_per_year[i] = { year:i + 1, cost:seed_oepy };

          chartObjects.push({ seriesName: 'operation_expenditure_per_year', colour: '#858687', data: operation_expenditure_per_year });
          legend += '<li><span style="background-color:#858687"></span> ' + legend_txt[0] + '</li>';
        }

        if (seed_dspy != null) {
          var direct_support_per_year = [];

          for ( i = 0; i < 30; i++ )
            direct_support_per_year[i] = { year:i + 1, cost:seed_dspy };

          chartObjects.push({ seriesName: 'direct_support_per_year', colour: '#f8ea03', data: direct_support_per_year });
          legend += '<li><span style="background-color:#f8ea03"></span>  ' + legend_txt[1] + '</li>';
        }

        if (seed_ispy != null) {
          var indirect_support_per_year = [];

          for ( i = 0; i < 30; i++ )
            indirect_support_per_year[i] = { year:i + 1, cost:seed_ispy };

          chartObjects.push({ seriesName: 'indirect_support_per_year', colour: '#1f9ed8', data: indirect_support_per_year });
          legend += '<li><span style="background-color:#1f9ed8"></span>  ' + legend_txt[2] + '</li>';
        }

        if (tech.length >= 1) {
          var cost_capital_tech = [];
          var colours_cct = [ 'FF6600', 'CC5200', 'FF8533' ];

          for ( i = 0; i < tech.length; i++ ) {
            cost_capital_tech[i] = [];
            for ( j = 1; j < 31; j++ ) {
              cost_capital_tech[i][j-1] = { year:j , cost: (loan_payback[i] >= j) ? loan_cost[i] : 0 };
            }
            chartObjects.push({ seriesName: 'cost_of_capital_' + i, colour: '#' + colours_cct[i], data: cost_capital_tech[i] });
            legend += '<li><span style="background-color:#' + colours_cct[i] + '"></span> Tech ' + (i+1) + ':  ' + legend_txt[3] + '</li>';
          }
        }

        if (tech.length >= 1) {
          var capital_maintenance_expenditure = [];

          for ( i = 1; i < 31; i++ ) {
            var n = 0;
            for ( j = 0; j < tech.length; j++ ) {
              var p = ((i % system_lifespan[j]) === 0) ? actual_hardware[j] : 0;
              n += p;
            }
            capital_maintenance_expenditure[i-1] = { year:i , cost: n }; 
          }

          chartObjects.push({ seriesName: 'capital_maintenance_expenditure', colour: '#222222', data: capital_maintenance_expenditure });
          legend += '<li><span style="background-color:#222222"></span>  ' + legend_txt[4] + '</li>';
        }

        if (chartObjects.length > 1)
          chart.render( chartObjects );

        legend += '</ul>';

        $(legend).insertBefore('.report--chart')
      }
      else
      {
        chart = new WashCostLineChart().init(
        {
          parent: $( this )[0],
          id: 'washcostlineChart',
          dimensions: { width:container.width(), height:container.height() },
          padding:{ top:40, right:0, bottom:40, left:52 },
          axisTypes: {x:'linear', y:'linear', z:null},
          colourPalette:[ '#ffffff' ],
          backgroundColour: 'transparent',
          lineStrokeColour: 'white',
          hideAxes:false,
          xAxisStyle: { hide:false, tickTextSize:'10px', titleTextSize:'13px', textWeight:300, textColour:'#a6955e', titleColour:'#a6955e', tickColour:'', tickSize:6, tickPadding:8, tickCount:10, textFamily:'Helvetica', lineColour:'transparent', renderSymbol:false },
          yAxisStyle: { hide:true },
          gridLineStyle:{ colour: '#a6955e', dashArray:[ ] },
          shouldScrub:false,
          yPadding:0.3,
          dataAccessors:{ x:function(d){ return d.x; }, y:function(d){ return d.y; } }
        } );

        chart.render(
        {
          capital: container.data( 'chart-capital' ),
          recurrent: container.data( 'chart-recurrent' ),
          population: container.data( 'chart-population' )
        } );
      }
    } );
  }


  init();
} );

