<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Utils;

use Symfony\Component\HttpFoundation\Request;

/**
 * Description of Utils
 *
 * @author bambo
 */
class Utils {

    public static $sender = 'support-grh@univ-thies.sn';
    public static $senderName = 'GRH UIDT';
    public static $websiteUrl = 'https://grh.uidt.sn/#';
    public static $passwordResetLink = 'https://grh.uidt.sn/#/public/new-password/';

    public static function serializeRequestContent(Request $request) {
        return json_decode($request->getContent(), true);
    }
    
    public static function getObjectFromRequest(Request $request) {
        return json_decode($request->getContent());
    }

}