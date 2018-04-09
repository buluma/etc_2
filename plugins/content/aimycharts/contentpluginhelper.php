<?php
/*
 * Copyright (c) 2015-2017 Aimy Extensions, Lingua-Systems Software GmbH
 *
 * http://www.aimy-extensions.com/
 *
 * License: GNU GPLv2, see LICENSE.txt within distribution and/or
 *          http://www.aimy-extensions.com/software-license.html
 */
 defined( '_JEXEC' ) or die(); abstract class AimyChartsContentPluginHelper { static public function parse_editor_html( $s ) { $s = html_entity_decode( $s, ENT_COMPAT, 'UTF-8' ); $s = str_replace( "\xC2\xA0", ' ', $s ); $s = preg_replace( '#\s*<br\s*/?>\s*#', "\n", $s ); return strip_tags( $s ); } static public function split_lines( $s ) { return preg_split( '#(\s*\r?\n\s*)+#', $s ); } static public function parse_line( $l ) { $l = preg_replace( '#\s*;\s*$#', '', $l ); return preg_split( '#\s*;\s*#', $l ); } static public function phpva_json_encode( $data ) { $opt = 0; if ( defined( 'JSON_UNESCAPED_UNICODE' ) ) { $opt += JSON_UNESCAPED_UNICODE; } return json_encode( $data, $opt ); } } 
