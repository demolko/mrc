
<?php
include_once __DIR__ . '/config/session.php';
include_once __DIR__ . '/config/Database.php';
include_once __DIR__ . '/config/utilities.php';

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
?>

<?php
include_once 'modules/login/parseLogin.php';
?>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" type="text/css" href="./css/buttons.css" />
    <link rel="stylesheet" type="text/css" href="./css/custom_page_layout.css" />
    <link rel="stylesheet" type="text/css" href="./css/forms.css" />
    <link rel="stylesheet" type="text/css" href="./css/modals.css" />
</head>

<body class="index_body">

    <div class="container index_container">
        <section class="col-lg-7">
            <div class="index_logo_div">
                <img class='index_logo_img' src="img/logo_mrc.png">
            </div>
            <hr class='index_hr'>
            <div>
                <div style="color:white;"><?php if(isset($result)) echo $result; ?></div>
                <?php if(!empty($form_errors)) echo show_errors($form_errors); ?>
            </div>
            <div class="clearfix"></div>
            <form action="" method="post">

                <div class="form-group">
                    <input type="text" class="form-control input_text_login" name="username" id="usernameField" placeholder="Login">
                </div>

                <div class="form-group">
                    <input type="password" name="password" class="form-control input_text_login" id="passwordField" placeholder="Hasło">
                </div>

                <div class="checkbox">
                    <label class="index_remember_label">
                        <input name="remember" value="yes" type="checkbox" > <span class="index_remember_text">Zapamiętaj mnie</span>
                    </label>
                </div>

                <input type="hidden" name="token" value="<?php if(function_exists('_token')) echo _token(); ?>">
                <button type="submit" name="loginBtn" class="btn btn-primary pull-right button_login">Zaloguj się</button>
                <div class="g-recaptcha" data-sitekey="6LcUilcUAAAAAF-NW0OsJXhV3fVZXv2QGxmCznZP"></div>

            </form>
        </section>
    </div>
</body>