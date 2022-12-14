//+------------------------------------------------------------------+
//|                                                   C_telegram.mqh |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
class C_telegram
  {
private:
   string            i_token;
   string            i_canal;

public:
                     C_telegram();
                    ~C_telegram();

   void              inicializar(const string _token, const string _canal);

   bool              enviarMensaje(const string _mensaje);

  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_telegram::C_telegram()
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_telegram::~C_telegram()
  {
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_telegram::inicializar(const string _token, const string _canal)
  {
   i_token = _token;
   i_canal = _canal;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_telegram::enviarMensaje(const string _mensaje)
  {

   string cookie = NULL;
   string headers;
   char    result[];
   char   post[];
   
   const string url = "https://api.telegram.org/";

   const string url1 =
      url +
      "bot" + i_token +
      "/sendMessage?" +
      "chat_id=" + i_canal +
      "&text=" + _mensaje
      ;

   int res = WebRequest("GET", url1, cookie, NULL, 500, post, 0, result, headers);

   if(res==-1)
     {
      Print("Error en WebRequest. Código de error  =", GetLastError());
      return false;
     }

   if(res != 200)
     {
      PrintFormat("Error de carga '%s', código %d",url,res);
      return false;
     }

   Print("mensaje enviado.");
   
   return true;

  }
//+------------------------------------------------------------------+
