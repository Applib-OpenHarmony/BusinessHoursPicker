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

export class BusinessModel {
  private workingDays: boolean[] = [false, false, false, false, false, false, false];
  private from: string[] = ["", "", "", "", "", "", ""]
  private to: string[] = ["", "", "", "", "", "", ""]
  static dayArr: string[] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

  constructor(business?: BusinessModel) {
    if (business) {
      this.workingDays = business.workingDays
      this.from = business.from
      this.to = business.to
    }
  }

  setWorkingDay = (day: number, v: boolean): void => {
    if (day == null || v == null) {
      return
    }
    if (day <= 7 && day >= 1) {
      this.workingDays[day - 1] = v;
    }
  }
  setFromTime = (day: number, fromTime: string): void => {
    if (day == null || fromTime == null) {
      return
    }
    if (day <= 7 && day >= 1) {
      this.from[day - 1] = fromTime;
    }
  }
  setToTime = (day: number, toTime: string): void => {
    if (day == null || toTime == null) {
      return
    }
    if (day <= 7 && day >= 1) {
      this.to[day - 1] = toTime;
    }
  }
  isWorkingDay = (day: number): boolean => {
    if (day <= 7 && day >= 1) {
      return this.workingDays[day - 1];
    }
    else {
      return false
    }
  }
  getWorkingDays = (): boolean[] => {
    return this.workingDays;
  }
  getFromTime = (day: number): string => {
    if (day <= 7 && day >= 1) {
      return this.from[day - 1];
    }
    return ""
  }
  getToTime = (day: number): string => {
    if (day <= 7 && day >= 1) {
      return this.to[day - 1];
    }
    return ""
  }

  isValid = (working: boolean[]): any => {
    var done = true;
    var message: string = ""
    for (var i: number = 0;i < 7; i++) {
      if (working[i] == true) {
        if (this.getFromTime(i + 1) === "") {
          message = "Set the from and to time properly\nfor the day: " + BusinessModel.dayArr[i]
          done = false
          break
        }
      }
    }
    if (done) {
      message = "Saved"
    }
    return { done, message }
  }
}
