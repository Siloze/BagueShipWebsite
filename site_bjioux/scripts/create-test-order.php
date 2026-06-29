<?php
if ( ! function_exists( 'wc_create_order' ) ) {
    fwrite( STDERR, "WooCommerce missing\n" );
    exit( 1 );
}

$order = wc_create_order();
$variation = wc_get_product( 17 );
if ( ! $variation ) {
    fwrite( STDERR, "Variation missing\n" );
    exit( 1 );
}

$order->add_product( $variation, 1 );
$billing = array(
    'first_name' => 'Test',
    'last_name'  => 'Client',
    'email'      => 'test@example.com',
    'phone'      => '0600000000',
    'address_1'  => '1 rue du Test',
    'city'       => 'Paris',
    'postcode'   => '75001',
    'country'    => 'FR',
);
$order->set_address( $billing, 'billing' );
$order->set_address(
    array(
        'first_name' => 'Test',
        'last_name'  => 'Client',
        'address_1'  => '1 rue du Test',
        'city'       => 'Paris',
        'postcode'   => '75001',
        'country'    => 'FR',
    ),
    'shipping'
);
$order->set_payment_method( 'bagueship_test' );
$order->set_payment_method_title( 'Paiement de test' );
$order->calculate_totals();
$order->payment_complete();
$order->save();

echo $order->get_id() . PHP_EOL;
