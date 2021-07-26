import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    Intl.defaultLocale = locale.languageCode;
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

class AppLocalizations {
  Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  set localizedValues(Map<String, dynamic>? value) {
    if (value == null) {
      value = {};
    }
    _localizedValues = value;
  }

  String? getLocalizedValue(String? key) {
    if (key != null && _localizedValues.containsKey(key)) {
      return _localizedValues[key];
    }
    return key;
  }

  static Map<String, dynamic> _localizedValues = {
    'messageError':
        'Lo sentimos ha ocurrido un error valide su conexión a Internet!',
    'agentType': 'Tipo de agente',
    'password': 'Contraseña',
    'agentCode': 'Codigo del agente',
    'forgotUserNameQuestion': '¿Olvidaste tu usuario?',
    'continue': 'Continuar',
    'signInText': 'Iniciar sesión',
    'cancel': 'Cancelar',
    'errorTitleCustomAlert': '¡Lo sentimos!',
    'authWrongCredentialsError':
        'Verifica tus credenciales, usuario y/o contraseña no válida.',
    'accept': 'Aceptar',
    'unlockPasswordText': 'Desbloquear contraseña',
    'defaultTitleError': 'Error',
    'profile': 'Perfil',
    'list': 'Listado',
    'agent': 'Agente',
    'type': 'Tipo',
    'user': 'Usuario',
    'sicomCode': 'Código SICOM',
    'name': 'Nombre',
    'logout': 'Cerrar Sesión',
    'orders': 'Ordenes de pedido',
    'orderRegisters': 'Útimos registros',
    'filters': 'Filtros',
    'codeAutorization': 'Código de autorización',
    'codeInter': 'Código interno',
    'codeSicomClient': 'Codigo SICOM Cliente',
    'codeSicomProvider': 'Codigo SICOM Proveedor',
    'typeOrder': 'Tipo de orden',
    'typebuyer': 'Tipo de comprador',
    'buyersubtype': 'Subtipo de comprador',
    'tradename': 'Nombre comercial',
    'buyersNit': 'Nit del comprador',
    'department': 'Departamento',
    'municipality': 'Municipio',
    'address': 'Dirección',
    'installationDepartment': 'Departamento instalación',
    'typeProvider': 'Tipo de proveedor',
    'tradenameProvider': 'Nombre comercial',
    'supplyPlant': 'Planta de abastecimiento Despacho',
    'dateInitial': 'Fecha de entrega sugerida',
    'dateFinal': 'Fecha de entrega sugerida fin',
    'filter': 'FILTRAR',
    'removeFilter': 'Quitar filtros',
    'buyer': 'Comprador',
    'client': 'Cliente',
    'delivery': 'Sugerida entrega',
    'requested': 'Solicitado',
    'transportType': "Tipo de transporte",
    'vehicleIdentification': "Placa",
    'driver': 'Conductor',
    'driverIdentification': 'Numero de cedula',
    'totalCapacity': 'Capacidad total',
    'state': 'Estado',
    'observations': 'Observaciones',
    'deliverDate': 'Fecha sugerida de entrega',
    'invoiceNumber': 'Número de factura',
    'uniqueTransportationGuide': 'Guía única de transporte',
    'validitySingleTransportGuide': 'Vigencia de la guía única de transporte',
    'transPortType': 'Tipo de trasporte',
    'orderWithinBorderQuota': 'Pedido dentro del cupo frontera',
    'orderWithinNationlQuota': 'Pedido dentro del cupo nacional',
    'aditionalInformation': 'Informacion adicional ',
    'urlSicom': 'https://www.sicom.gov.co/sicom/identificacionAction.do',
    'ordenStatus': 'Estado de la orden',
    'loadingOrders': 'Cargando pedidos...',
    'loadingTypeOrders': 'Cargando tipos de ordenes',
    'loadingProfile': 'Cargando perfil...',
    'product': "Producto",
    'requestedVolume': 'Volumen solicitado',
    'acceptedVolume': 'Volumen aceptado',
    'dispatchedVolume': 'Volumen despachado',
    'cleanFields': 'LIMPIAR CAMPOS',
    'loadOrderDetails': 'Cargando detalles de la orden',
    'sorry': 'Lo sentimos no se pudo cargar la información, intente de nuevo',
    'retry': 'Reintentar',
    'noDataToView': 'No hay datos para mostrar',
    'loadProductDetails': 'Cargando detalles del producto',
    'noInternet': 'Sin Internet',
    'messageNoInternet':
        'No es posible conectar a Sicom Líquidos, verifica tu conexión a internet e intenta nuevamente.',
    'informationConsumptions': 'Consumo mes actual',
    'assignedQuota': 'Asignado',
    'finalQuota': 'Cupo',
    'availableQuota': 'Disponible',
    'consumption': 'Consumo',
    'cededVolume': 'Cedido',
    'percent': 'Porcentaje consumido',
    'informationAcount': 'Información de cuenta',
    'exit': 'Salir',
    'withoutConsumption': 'No tiene consumos para mostrar.',
    'copiedText': 'Texto copiado.',
    'notifications': 'Notificaciones',
    'dueDate': 'Vence',
    'viewMore': 'Ver más',
    'archive': 'archivo',
    'dashboard': 'Dashboard',
    'currentMonthConsumption': 'consumo de mes actual',
    'doubleFactorViewTitle': 'Se requiere doble autenticación',
    'doubleFactorViewMessage':
        'Por favor digite el código de autenticación para poder ingresar',
    'authenticate': 'autenticar',
    'code': 'Código',
    'authWrongTokenError': 'Código no válido.',
  };

  String? get assignedQuota => getLocalizedValue('assignedQuota');
  String? get withoutConsumption => getLocalizedValue('withoutConsumption');

  String? get exit => getLocalizedValue('exit');

  String? get finalQuota => getLocalizedValue('finalQuota');

  String? get availableQuota => getLocalizedValue('availableQuota');

  String? get consumption => getLocalizedValue('consumption');

  String? get cededVolume => getLocalizedValue('cededVolume');

  String? get percent => getLocalizedValue('percent');

  String? get informationConsumptions =>
      getLocalizedValue('informationConsumptions');

  String? get informationAcount => getLocalizedValue('informationAcount');

  String? get loadProductDetails => getLocalizedValue('loadProductDetails');

  String? get messageError => getLocalizedValue('messageError');

  String? get retry => getLocalizedValue('retry');

  String? get agentType => getLocalizedValue('agentType');

  String? get agentCode => getLocalizedValue('agentCode');

  String? get loadOrderDetails => getLocalizedValue('loadOrderDetails');

  String? get sorry => getLocalizedValue('sorry');

  String? get password => getLocalizedValue('password');

  String? get product => getLocalizedValue('product');

  String? get requestedVolume => getLocalizedValue('requestedVolume');

  String? get acceptedVolume => getLocalizedValue('acceptedVolume');

  String? get dispatchedVolume => getLocalizedValue('dispatchedVolume');

  String? get user => getLocalizedValue('user');

  String? get sicomCode => getLocalizedValue('sicomCode');

  String? get forgotUserNameQuestion =>
      getLocalizedValue('forgotUserNameQuestion');

  String? get continueKey => getLocalizedValue('continue');

  String? get signInText => getLocalizedValue('signInText');

  String? get cancel => getLocalizedValue('cancel');

  String? get errorTitleCustomAlert =>
      getLocalizedValue('errorTitleCustomAlert');

  String? get authWrongCredentialsError =>
      getLocalizedValue('authWrongCredentialsError');

  String? get accept => getLocalizedValue('accept');

  String? get unlock => getLocalizedValue('unlock');

  String? get defaultTitleError => getLocalizedValue('defaultTitleError');

  String? get profile => getLocalizedValue('profile');

  String? get list => getLocalizedValue('list');

  String? get agent => getLocalizedValue('agent');

  String? get type => getLocalizedValue('type');

  String? get name => getLocalizedValue('name');

  String? get logout => getLocalizedValue('logout');

  String? get orders => getLocalizedValue('orders');

  String? get orderRegisters => getLocalizedValue('orderRegisters');

  String? get filters => getLocalizedValue('filters');

  String? get codeAutorization => getLocalizedValue('codeAutorization');

  String? get codeInter => getLocalizedValue('codeInter');

  String? get codeSicomClient => getLocalizedValue('codeSicomClient');

  String? get codeSicomProvider => getLocalizedValue('codeSicomProvider');

  String? get typeOrder => getLocalizedValue('typeOrder');

  String? get typeBuyer => getLocalizedValue('typebuyer');

  String? get buyerSubtype => getLocalizedValue('buyersubtype');

  String? get tradeName => getLocalizedValue('tradename');

  String? get buyersNit => getLocalizedValue('buyersNit');

  String? get department => getLocalizedValue('department');

  String? get municipality => getLocalizedValue('municipality');

  String? get address => getLocalizedValue('address');

  String? get installationDepartment =>
      getLocalizedValue('installationDepartment');

  String? get typeProvider => getLocalizedValue('typeProvider');

  String? get tradenameProvider => getLocalizedValue('tradenameProvider');

  String? get supplyPlant => getLocalizedValue('supplyPlant');

  String? get dateInitial => getLocalizedValue('dateInitial');

  String? get dateFinal => getLocalizedValue('dateFinal');

  String? get filter => getLocalizedValue('filter');

  String? get removeFilter => getLocalizedValue('removeFilter');

  String? get buyer => getLocalizedValue('buyer');

  String? get client => getLocalizedValue('client');

  String? get delivery => getLocalizedValue('delivery');

  String? get requested => getLocalizedValue('requested');

  String? get transportType => getLocalizedValue('transportType');

  String? get vehicleIdentification =>
      getLocalizedValue('vehicleIdentification');

  String? get driver => getLocalizedValue('driver');

  String? get driverIdentification => getLocalizedValue('driverIdentification');

  String? get totalCapacity => getLocalizedValue('totalCapacity');

  String? get state => getLocalizedValue('state');

  String? get observations => getLocalizedValue('observations');

  String? get deliverDate => getLocalizedValue('deliverDate');

  String? get invoiceNumber => getLocalizedValue('invoiceNumber');

  String? get uniqueTransportationGuide =>
      getLocalizedValue('uniqueTransportationGuide');

  String? get validitySingleTransportGuide =>
      getLocalizedValue('validitySingleTransportGuide');

  String? get transPortType => getLocalizedValue('transPortType');

  String? get orderWithinBorderQuota =>
      getLocalizedValue('orderWithinBorderQuota');

  String? get orderWithNationalQuota =>
      getLocalizedValue('orderWithinNationlQuota');

  String? get additionalInformation =>
      getLocalizedValue('aditionalInformation');

  String? get urlSicom => getLocalizedValue('urlSicom');

  String? get ordenStatus => getLocalizedValue('ordenStatus');

  String? get loadingOrders => getLocalizedValue('loadingOrders');

  String? get loadingProfile => getLocalizedValue('loadingProfile');

  String? get loadingTypeOrders => getLocalizedValue('loadingTypeOrders');

  String? get cleanFields => getLocalizedValue('cleanFields');

  String? get noDataToView => getLocalizedValue('noDataToView');

  String? get noInternet => getLocalizedValue('noInternet');

  String? get messageNoInternet => getLocalizedValue('messageNoInternet');

  String? get copiedText => getLocalizedValue('copiedText');

  String? get notifications => getLocalizedValue('notifications');

  String? get dueDate => getLocalizedValue('dueDate');

  String? get viewMore => getLocalizedValue('viewMore');

  String? get archive => getLocalizedValue('Archivo');

  String? get dashboard => getLocalizedValue('dashboard');

  String? get currentMonthConsumption =>
      getLocalizedValue('currentMonthConsumption');

  String? get doubleFactorViewTitle =>
      getLocalizedValue('doubleFactorViewTitle');

  String? get doubleFactorViewMessage =>
      getLocalizedValue('doubleFactorViewMessage');

  String? get authenticate => getLocalizedValue('authenticate');

  String? get code => getLocalizedValue('code');

  String? get authWrongTokenError => getLocalizedValue('authWrongTokenError');
}
