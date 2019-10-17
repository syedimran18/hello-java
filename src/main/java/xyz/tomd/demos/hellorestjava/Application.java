package xyz.tomd.demos.hellorestjava;

import io.undertow.Undertow;
import io.undertow.server.HttpHandler;
import io.undertow.server.HttpServerExchange;
import io.undertow.util.Headers;

/**
 * Hello world!
 * Based on the Undertow examples: https://github.com/undertow-io/undertow/tree/master/examples
 *
 */
public class Application {

    public static void main( String[] args ) {
        Undertow server = Undertow.builder()
                .addHttpListener(8080, "localhost")
                .setHandler(new HttpHandler() {
                    @Override
                    public void handleRequest(final HttpServerExchange exchange) throws Exception {
                        exchange.getResponseHeaders().put(Headers.CONTENT_TYPE, "text/plain");
                        exchange.getResponseSender().send("Hello, world!");
                    }
                }).build();
        server.start();
    }
}
