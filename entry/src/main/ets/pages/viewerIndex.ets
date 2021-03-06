/*
 * Copyright (C) 2022 Application Library Engineering Group
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { BusinessHoursWeekView, BusinessModel } from '@ohos/bhlib'
import router from '@system.router';

@Component
@Preview
@Entry
struct ViewerIndex {
  finalBusinessModel: BusinessModel = <BusinessModel> router.getParams().finalBusinessModel;

  build() {
    Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      BusinessHoursWeekView({
        showBusinessModel: this.finalBusinessModel,
        bhIcon: $r('app.media.calendar'),
        bhIconPadding: '10vp',
        bhTextColor: '#000000',
        bhTextSize: '20fp',
        bhTextStyle: 'calibri',
        bhTodayColor: '#4e754d',
        bhTodayStyle: 'calibri',
        bhTodayTextSize: '22fp',
        bhTodayIcon: $r('app.media.unlock')
      })
    }.backgroundColor(0xebebeb).width('100%').height('100%')
  }
}