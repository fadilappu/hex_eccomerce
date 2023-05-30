package com.example.hex_ecommerce

import android.os.Bundle
import android.util.Log
import android.widget.Toast
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugins.paytm.PaytmPaymentTransactionCallback
import io.flutter.plugins.paytm.PaytmPGService
import io.flutter.plugins.paytm.PaytmOrder

class MainActivity : FlutterActivity(), MethodChannel.MethodCallHandler {

    private val CHANNEL = "com.example.hex_ecommerce/payment"

    private lateinit var service: PaytmPGService
    private lateinit var mapCredentials: MutableMap<String, String>
    private lateinit var paytmOrder: PaytmOrder

    private var orderId: String? = null
    private lateinit var result: MethodChannel.Result

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        this.result = result
        val args = call.arguments as? Map<*, *> ?: return
        orderId = args["order_id"]?.toString()

        service = PaytmPGService.getStagingService()
        mapCredentials = HashMap()
        mapCredentials["MID"] = args["mid"].toString()
        mapCredentials["ORDER_ID"] = args["order_id"].toString()
        mapCredentials["CUST_ID"] = args["customer_id"].toString()
        mapCredentials["MOBILE_NO"] = args["customer_phone"].toString()
        mapCredentials["EMAIL"] = args["customer_email"].toString()
        mapCredentials["CHANNEL_ID"] = "WAP"
        mapCredentials["TXN_AMOUNT"] = args["amount"].toString()
        mapCredentials["WEBSITE"] = "WEBSTAGING"
        mapCredentials["INDUSTRY_TYPE_ID"] = "Retail"
        mapCredentials["CALLBACK_URL"] = args["callback_url"].toString() + orderId
        mapCredentials["CHECKSUMHASH"] = args["checksum"].toString()

        paytmOrder = PaytmOrder(mapCredentials)
        service.initialize(paytmOrder, null)
        service.startPaymentTransaction(this@MainActivity, true, true, object : PaytmPaymentTransactionCallback {
            override fun onTransactionResponse(inResponse: Bundle) {
                if (inResponse.getString("STATUS") == "TXN_FAILURE") {
                    result.error("TXN_FAILURE", "Transaction Failure", null)
                } else {
                    result.success(1)
                }
                Log.d("PayTM", inResponse.toString())
            }

            override fun networkNotAvailable() {
                result.success(0)
                Toast.makeText(applicationContext, "Network Not Available. Please check your internet connection.", Toast.LENGTH_LONG).show()
            }

            override fun clientAuthenticationFailed(inErrorMessage: String) {
                result.success(0)
                Toast.makeText(applicationContext, "Client Authentication failed: $inErrorMessage", Toast.LENGTH_LONG).show()
            }

            override fun someUIErrorOccurred(inErrorMessage: String) {
                result.success(0)
                Toast.makeText(applicationContext, "Error response: $inErrorMessage", Toast.LENGTH_LONG).show()
            }

            override fun onErrorLoadingWebPage(iniErrorCode: Int, inErrorMessage: String, inFailingUrl: String) {
                result.success(0)
                Toast.makeText(applicationContext, "Error response: $inErrorMessage", Toast.LENGTH_LONG).show()
            }
override fun onBackPressedCancelTransaction() {
result.success(0)
Toast.makeText(applicationContext, "onBackPressedCancelTransaction", Toast.LENGTH_LONG).show()
}
        override fun onTransactionCancel(inErrorMessage: String, inResponse: Bundle) {
            result.success(0)
            Toast.makeText(applicationContext, "Error response: $inErrorMessage", Toast.LENGTH_LONG).show()
        }
    })
}
}
