// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:mywebflutterapp/models/line_recurring_plans_entity.dart';
import 'package:mywebflutterapp/generated/json/line_recurring_plans_entity_helper.dart';
import 'package:mywebflutterapp/models/get_products_model_entity.dart';
import 'package:mywebflutterapp/generated/json/get_products_model_entity_helper.dart';
import 'package:mywebflutterapp/models/lines_detail_entity.dart';
import 'package:mywebflutterapp/generated/json/lines_detail_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
			case LineRecurringPlansEntity:
				return lineRecurringPlansEntityFromJson(data as LineRecurringPlansEntity, json) as T;
			case LineRecurringPlansLineRecurringPlan:
				return lineRecurringPlansLineRecurringPlanFromJson(data as LineRecurringPlansLineRecurringPlan, json) as T;
			case LineRecurringPlansMeta:
				return lineRecurringPlansMetaFromJson(data as LineRecurringPlansMeta, json) as T;
			case GetProductsModelEntity:
				return getProductsModelEntityFromJson(data as GetProductsModelEntity, json) as T;
			case GetProductsModelProduct:
				return getProductsModelProductFromJson(data as GetProductsModelProduct, json) as T;
			case GetProductsModelProductsLinks:
				return getProductsModelProductsLinksFromJson(data as GetProductsModelProductsLinks, json) as T;
			case GetProductsModelProductsMeta:
				return getProductsModelProductsMetaFromJson(data as GetProductsModelProductsMeta, json) as T;
			case GetProductsModelProductsMetaAttributeTitles:
				return getProductsModelProductsMetaAttributeTitlesFromJson(data as GetProductsModelProductsMetaAttributeTitles, json) as T;
			case GetProductsModelProductsAttributeValues:
				return getProductsModelProductsAttributeValuesFromJson(data as GetProductsModelProductsAttributeValues, json) as T;
			case GetProductsModelProductsAttributeValues6:
				return getProductsModelProductsAttributeValues6FromJson(data as GetProductsModelProductsAttributeValues6, json) as T;
			case GetProductsModelProductsDeliveryDetailLabels:
				return getProductsModelProductsDeliveryDetailLabelsFromJson(data as GetProductsModelProductsDeliveryDetailLabels, json) as T;
			case GetProductsModelMeta:
				return getProductsModelMetaFromJson(data as GetProductsModelMeta, json) as T;
			case LinesDetailEntity:
				return linesDetailEntityFromJson(data as LinesDetailEntity, json) as T;
			case LinesDetailLine:
				return linesDetailLineFromJson(data as LinesDetailLine, json) as T;
			case LinesDetailLinesLinks:
				return linesDetailLinesLinksFromJson(data as LinesDetailLinesLinks, json) as T;
			case LinesDetailLinesMeta:
				return linesDetailLinesMetaFromJson(data as LinesDetailLinesMeta, json) as T;
			case LinesDetailLinesMetaAttributeTitles:
				return linesDetailLinesMetaAttributeTitlesFromJson(data as LinesDetailLinesMetaAttributeTitles, json) as T;
			case LinesDetailLinesAttributeValues:
				return linesDetailLinesAttributeValuesFromJson(data as LinesDetailLinesAttributeValues, json) as T;
			case LinesDetailLinesServiceDetails:
				return linesDetailLinesServiceDetailsFromJson(data as LinesDetailLinesServiceDetails, json) as T;
			case LinesDetailDeviceIdentifier:
				return linesDetailDeviceIdentifierFromJson(data as LinesDetailDeviceIdentifier, json) as T;
			case LinesDetailMeta:
				return linesDetailMetaFromJson(data as LinesDetailMeta, json) as T;
			case LinesDetailMetaSums:
				return linesDetailMetaSumsFromJson(data as LinesDetailMetaSums, json) as T;
			case LinesDetailMetaPagination:
				return linesDetailMetaPaginationFromJson(data as LinesDetailMetaPagination, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {
			case LineRecurringPlansEntity:
				return lineRecurringPlansEntityToJson(data as LineRecurringPlansEntity);
			case LineRecurringPlansLineRecurringPlan:
				return lineRecurringPlansLineRecurringPlanToJson(data as LineRecurringPlansLineRecurringPlan);
			case LineRecurringPlansMeta:
				return lineRecurringPlansMetaToJson(data as LineRecurringPlansMeta);
			case GetProductsModelEntity:
				return getProductsModelEntityToJson(data as GetProductsModelEntity);
			case GetProductsModelProduct:
				return getProductsModelProductToJson(data as GetProductsModelProduct);
			case GetProductsModelProductsLinks:
				return getProductsModelProductsLinksToJson(data as GetProductsModelProductsLinks);
			case GetProductsModelProductsMeta:
				return getProductsModelProductsMetaToJson(data as GetProductsModelProductsMeta);
			case GetProductsModelProductsMetaAttributeTitles:
				return getProductsModelProductsMetaAttributeTitlesToJson(data as GetProductsModelProductsMetaAttributeTitles);
			case GetProductsModelProductsAttributeValues:
				return getProductsModelProductsAttributeValuesToJson(data as GetProductsModelProductsAttributeValues);
			case GetProductsModelProductsAttributeValues6:
				return getProductsModelProductsAttributeValues6ToJson(data as GetProductsModelProductsAttributeValues6);
			case GetProductsModelProductsDeliveryDetailLabels:
				return getProductsModelProductsDeliveryDetailLabelsToJson(data as GetProductsModelProductsDeliveryDetailLabels);
			case GetProductsModelMeta:
				return getProductsModelMetaToJson(data as GetProductsModelMeta);
			case LinesDetailEntity:
				return linesDetailEntityToJson(data as LinesDetailEntity);
			case LinesDetailLine:
				return linesDetailLineToJson(data as LinesDetailLine);
			case LinesDetailLinesLinks:
				return linesDetailLinesLinksToJson(data as LinesDetailLinesLinks);
			case LinesDetailLinesMeta:
				return linesDetailLinesMetaToJson(data as LinesDetailLinesMeta);
			case LinesDetailLinesMetaAttributeTitles:
				return linesDetailLinesMetaAttributeTitlesToJson(data as LinesDetailLinesMetaAttributeTitles);
			case LinesDetailLinesAttributeValues:
				return linesDetailLinesAttributeValuesToJson(data as LinesDetailLinesAttributeValues);
			case LinesDetailLinesServiceDetails:
				return linesDetailLinesServiceDetailsToJson(data as LinesDetailLinesServiceDetails);
			case LinesDetailDeviceIdentifier:
				return linesDetailDeviceIdentifierToJson(data as LinesDetailDeviceIdentifier);
			case LinesDetailMeta:
				return linesDetailMetaToJson(data as LinesDetailMeta);
			case LinesDetailMetaSums:
				return linesDetailMetaSumsToJson(data as LinesDetailMetaSums);
			case LinesDetailMetaPagination:
				return linesDetailMetaPaginationToJson(data as LinesDetailMetaPagination);
			}
			return data as T;
		}
  //Go back to a single instance by type
	static _fromJsonSingle<M>( json) {
		String type = M.toString();
		if(type == (LineRecurringPlansEntity).toString()){
			return LineRecurringPlansEntity().fromJson(json);
		}	else if(type == (LineRecurringPlansLineRecurringPlan).toString()){
			return LineRecurringPlansLineRecurringPlan().fromJson(json);
		}	else if(type == (LineRecurringPlansMeta).toString()){
			return LineRecurringPlansMeta().fromJson(json);
		}	else if(type == (GetProductsModelEntity).toString()){
			return GetProductsModelEntity().fromJson(json);
		}	else if(type == (GetProductsModelProduct).toString()){
			return GetProductsModelProduct().fromJson(json);
		}	else if(type == (GetProductsModelProductsLinks).toString()){
			return GetProductsModelProductsLinks().fromJson(json);
		}	else if(type == (GetProductsModelProductsMeta).toString()){
			return GetProductsModelProductsMeta().fromJson(json);
		}	else if(type == (GetProductsModelProductsMetaAttributeTitles).toString()){
			return GetProductsModelProductsMetaAttributeTitles().fromJson(json);
		}	else if(type == (GetProductsModelProductsAttributeValues).toString()){
			return GetProductsModelProductsAttributeValues().fromJson(json);
		}	else if(type == (GetProductsModelProductsAttributeValues6).toString()){
			return GetProductsModelProductsAttributeValues6().fromJson(json);
		}	else if(type == (GetProductsModelProductsDeliveryDetailLabels).toString()){
			return GetProductsModelProductsDeliveryDetailLabels().fromJson(json);
		}	else if(type == (GetProductsModelMeta).toString()){
			return GetProductsModelMeta().fromJson(json);
		}	else if(type == (LinesDetailEntity).toString()){
			return LinesDetailEntity().fromJson(json);
		}	else if(type == (LinesDetailLine).toString()){
			return LinesDetailLine().fromJson(json);
		}	else if(type == (LinesDetailLinesLinks).toString()){
			return LinesDetailLinesLinks().fromJson(json);
		}	else if(type == (LinesDetailLinesMeta).toString()){
			return LinesDetailLinesMeta().fromJson(json);
		}	else if(type == (LinesDetailLinesMetaAttributeTitles).toString()){
			return LinesDetailLinesMetaAttributeTitles().fromJson(json);
		}	else if(type == (LinesDetailLinesAttributeValues).toString()){
			return LinesDetailLinesAttributeValues().fromJson(json);
		}	else if(type == (LinesDetailLinesServiceDetails).toString()){
			return LinesDetailLinesServiceDetails().fromJson(json);
		}	else if(type == (LinesDetailDeviceIdentifier).toString()){
			return LinesDetailDeviceIdentifier().fromJson(json);
		}	else if(type == (LinesDetailMeta).toString()){
			return LinesDetailMeta().fromJson(json);
		}	else if(type == (LinesDetailMetaSums).toString()){
			return LinesDetailMetaSums().fromJson(json);
		}	else if(type == (LinesDetailMetaPagination).toString()){
			return LinesDetailMetaPagination().fromJson(json);
		}	
		return null;
	}

  //list is returned by type
	static M _getListChildType<M>(List data) {
		if(List<LineRecurringPlansEntity>() is M){
			return data.map<LineRecurringPlansEntity>((e) => LineRecurringPlansEntity().fromJson(e)).toList() as M;
		}	else if(List<LineRecurringPlansLineRecurringPlan>() is M){
			return data.map<LineRecurringPlansLineRecurringPlan>((e) => LineRecurringPlansLineRecurringPlan().fromJson(e)).toList() as M;
		}	else if(List<LineRecurringPlansMeta>() is M){
			return data.map<LineRecurringPlansMeta>((e) => LineRecurringPlansMeta().fromJson(e)).toList() as M;
		}	else if(List<GetProductsModelEntity>() is M){
			return data.map<GetProductsModelEntity>((e) => GetProductsModelEntity().fromJson(e)).toList() as M;
		}	else if(List<GetProductsModelProduct>() is M){
			return data.map<GetProductsModelProduct>((e) => GetProductsModelProduct().fromJson(e)).toList() as M;
		}	else if(List<GetProductsModelProductsLinks>() is M){
			return data.map<GetProductsModelProductsLinks>((e) => GetProductsModelProductsLinks().fromJson(e)).toList() as M;
		}	else if(List<GetProductsModelProductsMeta>() is M){
			return data.map<GetProductsModelProductsMeta>((e) => GetProductsModelProductsMeta().fromJson(e)).toList() as M;
		}	else if(List<GetProductsModelProductsMetaAttributeTitles>() is M){
			return data.map<GetProductsModelProductsMetaAttributeTitles>((e) => GetProductsModelProductsMetaAttributeTitles().fromJson(e)).toList() as M;
		}	else if(List<GetProductsModelProductsAttributeValues>() is M){
			return data.map<GetProductsModelProductsAttributeValues>((e) => GetProductsModelProductsAttributeValues().fromJson(e)).toList() as M;
		}	else if(List<GetProductsModelProductsAttributeValues6>() is M){
			return data.map<GetProductsModelProductsAttributeValues6>((e) => GetProductsModelProductsAttributeValues6().fromJson(e)).toList() as M;
		}	else if(List<GetProductsModelProductsDeliveryDetailLabels>() is M){
			return data.map<GetProductsModelProductsDeliveryDetailLabels>((e) => GetProductsModelProductsDeliveryDetailLabels().fromJson(e)).toList() as M;
		}	else if(List<GetProductsModelMeta>() is M){
			return data.map<GetProductsModelMeta>((e) => GetProductsModelMeta().fromJson(e)).toList() as M;
		}	else if(List<LinesDetailEntity>() is M){
			return data.map<LinesDetailEntity>((e) => LinesDetailEntity().fromJson(e)).toList() as M;
		}	else if(List<LinesDetailLine>() is M){
			return data.map<LinesDetailLine>((e) => LinesDetailLine().fromJson(e)).toList() as M;
		}	else if(List<LinesDetailLinesLinks>() is M){
			return data.map<LinesDetailLinesLinks>((e) => LinesDetailLinesLinks().fromJson(e)).toList() as M;
		}	else if(List<LinesDetailLinesMeta>() is M){
			return data.map<LinesDetailLinesMeta>((e) => LinesDetailLinesMeta().fromJson(e)).toList() as M;
		}	else if(List<LinesDetailLinesMetaAttributeTitles>() is M){
			return data.map<LinesDetailLinesMetaAttributeTitles>((e) => LinesDetailLinesMetaAttributeTitles().fromJson(e)).toList() as M;
		}	else if(List<LinesDetailLinesAttributeValues>() is M){
			return data.map<LinesDetailLinesAttributeValues>((e) => LinesDetailLinesAttributeValues().fromJson(e)).toList() as M;
		}	else if(List<LinesDetailLinesServiceDetails>() is M){
			return data.map<LinesDetailLinesServiceDetails>((e) => LinesDetailLinesServiceDetails().fromJson(e)).toList() as M;
		}	else if(List<LinesDetailDeviceIdentifier>() is M){
			return data.map<LinesDetailDeviceIdentifier>((e) => LinesDetailDeviceIdentifier().fromJson(e)).toList() as M;
		}	else if(List<LinesDetailMeta>() is M){
			return data.map<LinesDetailMeta>((e) => LinesDetailMeta().fromJson(e)).toList() as M;
		}	else if(List<LinesDetailMetaSums>() is M){
			return data.map<LinesDetailMetaSums>((e) => LinesDetailMetaSums().fromJson(e)).toList() as M;
		}	else if(List<LinesDetailMetaPagination>() is M){
			return data.map<LinesDetailMetaPagination>((e) => LinesDetailMetaPagination().fromJson(e)).toList() as M;
		}
		return null;
	}

  static M fromJsonAsT<M>(json) {
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json) as M;
    }
  }
}