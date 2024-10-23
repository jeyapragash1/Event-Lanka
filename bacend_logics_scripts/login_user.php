<?php

require_once '../Classes/Database.php';
require_once '../Classes/user.php';
require_once '../Classes/Admin.php';
require_once '../Classes/RegisteredUser.php';
require_once '../Classes/ServiceProvider.php';

session_start();

$database = new Database();
$db = $database->getConnection();

$user = new User($db);

if (isset($_POST['submit'])) {
    $username = htmlspecialchars(strip_tags($_POST['name']));
    $password = $_POST['password']; // Password should not be sanitized for hashing

    if ($user->login($username, $password)) {
        $_SESSION['user_name'] = $user->username; 
        $_SESSION['user_type'] = $user->userType;
        $_SESSION['user_id'] = $user->userId;

        
        if ($user->userType === 'admin') {
            
            $adminId = $user->getAdminId(); 
            $_SESSION['adminId'] = $adminId; 
        }

        header('Location: ../index.php'); 
        exit();
    } else {
        $_SESSION['error'] = "Invalid username or password. Please try again.";
        header('Location: ../login/login_form.php');
        exit();
    }
}
