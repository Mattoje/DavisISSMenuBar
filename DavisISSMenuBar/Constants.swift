//
// SPDX-License-Identifier: GPL-2.0-only
// Created by matteo on 08/01/24
// Copyright (C) 2024  Mattoje
// 


import Foundation
let myISSid=43 // Vantage Pro2 Wireless
// https://weatherlink.github.io/v2-api/rate-limits
// 900 seconds = 15 minutes = upload interval with basic (free) weatherlink account
let pollTime:Double=900
