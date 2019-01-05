<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" type="text/css" href="./css/buttons.css" />
    <link rel="stylesheet" type="text/css" href="./css/custom_page_layout.css" />
    <link rel="stylesheet" type="text/css" href="./css/forms.css" />
</head>

<body class="not_authorized_body">

<div class="container not_authorized_container">
    <section class="col-lg-7">
        <h2 style="color: white;">Brak autoryzacji</h2><hr>
        <div>
            <?php if(isset($result)) echo $result; ?>
            <?php if(!empty($form_errors)) echo show_errors($form_errors); ?>
        </div>
        <div class="clearfix"></div>
        <div style="color:white;">Nie posiadasz odpowiednich uprawnień do przeglądania tej strony, lub nie jesteś zalogowany.</div>
        <a href="index.php" style="text-decoration: none;"><div type="submit" name="loginBtn" class="btn btn-primary pull-right button_login" style="text-align: center;"><p style="padding-top: 10px;">Strona logowania</p></div></a>
    </section>
</div>
</body>