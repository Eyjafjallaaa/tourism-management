import moment from 'moment'


export function fmtDate(date){
  return date?moment(date).format('YYYY-MM-DD'):'';
}
export function fmtTime(date){
  return date?moment(date).format('YYYY-MM-DD HH:mm:ss'):'';
}