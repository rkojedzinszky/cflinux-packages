--- bind-9.9.5/lib/dns/openssl_link.c.orig	2014-05-21 17:18:06.402562550 +0200
+++ bind-9.9.5/lib/dns/openssl_link.c	2014-05-21 17:17:26.643374316 +0200
@@ -55,6 +55,9 @@
 #ifdef USE_ENGINE
 #include <openssl/engine.h>
 #endif
+#ifdef HAVE_OPENSSL_ECDSA
+#include <openssl/ecdsa.h>
+#endif
 
 static RAND_METHOD *rm = NULL;
 
