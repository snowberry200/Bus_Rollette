import 'package:bus_rullette/datasource/data_source.dart';
import 'package:bus_rullette/models/app_user.dart';
import 'package:bus_rullette/models/auth_response_model.dart';
import 'package:bus_rullette/models/bus_model.dart';
import 'package:bus_rullette/models/bus_reservation.dart';
import 'package:bus_rullette/models/bus_schedule.dart';
import 'package:bus_rullette/models/but_route.dart';
import 'package:bus_rullette/models/response_model.dart';

class DummyDatasource extends DataSource {
  @override
  Future<ResponseModel> addBus(Bus bus) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> addReservation(BusReservation reservation) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> addRoute(BusRoute busRoute) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> addSchedule(BusSchedule busSchedule) {
    throw UnimplementedError();
  }

  @override
  Future<List<Bus>> getAllBus() {
    throw UnimplementedError();
  }

  @override
  Future<List<BusReservation>> getAllReservation() {
    throw UnimplementedError();
  }

  @override
  Future<List<BusRoute>> getAllRoutes() {
    throw UnimplementedError();
  }

  @override
  Future<List<BusSchedule>> getAllSchedules() {
    throw UnimplementedError();
  }

  @override
  Future<List<BusReservation>> getReservationsByMobile(String mobile) {
    throw UnimplementedError();
  }

  @override
  Future<List<BusReservation>> getReservationsByScheduleAndDepartureDate(
    int scheduleId,
    String departureDate,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<BusRoute?> getRouteByCityFromAndCityTo(
    String cityFrom,
    String cityTo,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<BusRoute?> getRouteByRouteName(String routeName) {
    throw UnimplementedError();
  }

  @override
  Future<List<BusSchedule>> getSchedulesByRouteName(String routeName) {
    throw UnimplementedError();
  }

  @override
  Future<AuthResponseModel?> login(AppUser user) {
    throw UnimplementedError();
  }
}
