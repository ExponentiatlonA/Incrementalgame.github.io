<html>
    <head>
        <title>
            Number RNG Incremental
        </title>
    </head>

    <style>
        .number  {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 24px;
            text-align: center;
        }
        .numberNamer  {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 24px;
            text-align: center;
            margin-top: -20px;
        }
        .bitProcessors  {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 16px;
            text-align: left;
            margin-top: -20px;
            height: 70px;
            width: 150px;
        }
    </style>

    <body>
        <p id="number" class="number">
            0
        </p>
        <p id="numberNamer" class="numberNamer">
            Worthless
        </p>

        <div>
            <center>
                <button class="emptyMinded"><a href="https://discord.gg/56bCJjMtvf">Join Discord Server!</a></button>
            </center>
        </div>
        <div>
            <button class="bitProcessors" onclick="buy_1bitProcessor();">1-Bit Processors <br>Cost: <span id="_1bitProcessorCost">40</span><br>Boost: <span id="_1bitProcessorBoost">0</span>x</button>
            <button class="bitProcessors" onclick="buy_2bitProcessor();">2-Bit Processors <br>Cost: <span id="_2bitProcessorCost">2.00k</span><br>Boost: <span id="_2bitProcessorBoost">0</span>x</button>
        </div>
    </body>

    <script>
        var number = 0;
        var numberNamer = "Worthless";
        var POWER = 1;

        var _1bitProcessorCost = 40;
        var _1bitProcessorBoost = 0;
        var _2bitProcessorCost = 2000;
        var _2bitProcessorBoost = 0;

        function buy_1bitProcessor()  {
            if (number >= _1bitProcessorCost)  {
                number = number - _1bitProcessorCost;
                _1bitProcessorBoost = _1bitProcessorBoost + 1;
                _1bitProcessorCost = Math.round(_1bitProcessorCost * 1.2);
                document.getElementById("number").innerHTML = formatNumber(number);
                document.getElementById("_1bitProcessorCost").innerHTML = formatNumber(_1bitProcessorCost);
                document.getElementById("_1bitProcessorBoost").innerHTML = formatNumber(_1bitProcessorBoost);
            }
        }

        function buy_2bitProcessor()  {
            if (number >= _2bitProcessorCost)  {
                number = number - _2bitProcessorCost;
                _2bitProcessorBoost = _2bitProcessorBoost + 1;
                _2bitProcessorCost = Math.round(_2bitProcessorCost * 1.35);
                document.getElementById("number").innerHTML = formatNumber(number);
                document.getElementById("_2bitProcessorCost").innerHTML = formatNumber(_2bitProcessorCost);
                document.getElementById("_2bitProcessorBoost").innerHTML = formatNumber(_2bitProcessorBoost);
            }
        }

        function increaseNumber()  {
            number += POWER;
            document.getElementById("number").innerHTML = formatNumber(number);
        }

        function nameNumbers()  {
            if (number > 100) numberNamer = "Basic";
            if (number > 1000) numberNamer = "Normal";
            document.getElementById("number").innerHTML = formatNumber(number);
            document.getElementById("numberNamer").innerHTML = numberNamer;
        }

        function formatNumber(number) {
            if (number < 1000) {
                return number.toString();
            } else if (number < 1e6) {
                return (number / 1e3).toFixed(2) + ' K';
            } else if (number < 1e9) {
                return (number / 1e6).toFixed(2) + ' M';
            } else if (number < 1e12) {
                return (number / 1e9).toFixed(2) + ' B';
            } else if (number < 1e15) {
                return (number / 1e12).toFixed(2) + ' T';
            } else if (number < 1e18) {
                return (number / 1e15).toFixed(2) + ' Qa';
            } else if (number < 1e21) {
                return (number / 1e18).toFixed(2) + ' Qi';
            } else if (number < 1e24) {
                return (number / 1e21).toFixed(2) + ' Sx';
            } else if (number < 1e27) {
                return (number / 1e24).toFixed(2) + ' Sp';
            } else if (number < 1e30) {
                return (number / 1e27).toFixed(2) + ' Oc';
            } else if (number < 1e33) {
                return (number / 1e30).toFixed(2) + ' No';
            } else {
                return (number / 1e33).toFixed(2) + ' Dc';
            }
        }

        setInterval(() => {
            increaseNumber();
            nameNumbers();
        }, 100);

        setInterval(function() {
            number = number + _1bitProcessorBoost;
            number = number + _2bitProcessorBoost * 4;
            document.getElementById("number").innerHTML = formatNumber(number);
            //1BPs
            document.getElementById("_1bitProcessorCost").innerHTML = formatNumber(_1bitProcessorCost);
            document.getElementById("_1bitProcessorBoost").innerHTML = formatNumber(_1bitProcessorBoost);
            //2BPs
            document.getElementById("_2bitProcessorCost").innerHTML = formatNumber(_2bitProcessorCost);
            document.getElementById("_2bitProcessorBoost").innerHTML = formatNumber(_2bitProcessorBoost);
        }, 100);
    </script>
</html>
