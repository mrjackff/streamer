<?php
if (isset($_POST['button'])){

    $url = 'http://localhost:8080/panel/';
    $data = array('button' => $_POST['button']);

    $options = array(
        'http' => array(
            'header' => "Content-type: application/x-www-form-unrlencoded\r\n",
            'method' => 'POST',
            'content' => http_build_query($data)
        ),

    );
    $context = stream_context_create($options);
    $result = file_get_contents($url, false, $context);
    if ($result === FALSE){
        echo "sorry maybe your svchost is not runing | this reason your button can't be trigger";
    }
    else
    {
        echo "Function Successfully Trigger!| wait for applying";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gaming Themed Website</title>
    <style>
        body {
            background-color: #1a1a1d;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            overflow: hidden;
        }

        .navbar {
            width: 100%;
            background: #333;
            padding: 10px 0;
            display: flex;
            justify-content: space-around;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
            animation: glow 1s infinite alternate;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            transition: color 0.3s;
        }

        .navbar a:hover {
            color: #00ffff;
        }

        @keyframes glow {
            from {
                box-shadow: 0 0 10px #00ffff, 0 0 20px #00ffff, 0 0 30px #00ffff;
            }
            to {
                box-shadow: 0 0 20px #00ffff, 0 0 30px #00ffff, 0 0 40px #00ffff;
            }
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 50px); /* Subtract the height of the navbar */
        }

        .box {
            background: #333;
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.7);
            text-align: center;
            animation: boxGlow 1s infinite alternate;
        }

        .box input[type="button"] {
            background: #444;
            color: #fff;
            border: none;
            padding: 15px 30px;
            margin: 10px;
            border-radius: 5px;
            cursor: pointer;
            box-shadow: 0 0 10px rgba(0, 255, 255, 0.5);
            transition: box-shadow 0.3s;
        }

        .box input[type="button"]:hover {
            box-shadow: 0 0 20px rgba(0, 255, 255, 1);
        }

        @keyframes boxGlow {
            from {
                box-shadow: 0 0 10px #00ffff, 0 0 20px #00ffff, 0 0 30px #00ffff;
            }
            to {
                box-shadow: 0 0 20px #00ffff, 0 0 30px #00ffff, 0 0 40px #00ffff;
            }
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="#">Home</a>
        <a href="#">About</a>
        <a href="#">Services</a>
        <a href="#">Contact</a>
    </div>
    <div class="container">
        <div class="box">
            <form method= "post">
            <input type="button" name = "button"  value="Aimbot_Scan">
            <input type="button" name = "button"  value="Enable_Aimbot">
            <input type="button" name = "button"  value="Disable_Aimbot">
            <input type="button" name = "button"  value="Sniper_Scope">
            <input type="button" name = "button"  value="3D_Chams">

            </form>
        </div>
    </div>

    
</body>
</html>

