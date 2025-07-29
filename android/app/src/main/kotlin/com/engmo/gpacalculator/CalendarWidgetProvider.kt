package com.engmo.gpacalculator

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetProvider
import java.util.*
import kotlin.text.toIntOrNull
import android.graphics.Color

import android.app.PendingIntent
import android.content.Intent


class CalendarWidgetProvider : HomeWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences
    ) {
        updateWidgetView(context, appWidgetManager, appWidgetIds, widgetData)
    }

    private fun updateWidgetView(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences
    ) {

        val today = Calendar.getInstance()
        val todayYear = today.get(Calendar.YEAR)
        val todayMonth = today.get(Calendar.MONTH) + 1
        val todayDay = today.get(Calendar.DAY_OF_MONTH)

        for (widgetId in appWidgetIds) {
            val views = RemoteViews(context.packageName, R.layout.home_widget_layout)

            val intent = context.packageManager.getLaunchIntentForPackage(context.packageName)
            val pendingIntent = PendingIntent.getActivity(
                context,
                0,
                intent,
                PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT
            )
            views.setOnClickPendingIntent(R.id.widget_root, pendingIntent)

            val monthTitle = widgetData.getString("month_title", "") ?: ""
            views.setTextViewText(R.id.month_title, monthTitle)

            for (i in 1..35) {
                val dayNumber = widgetData.getString("day_${i}_number", "") ?: ""
                val eventLine1 = widgetData.getString("day_${i}_event_line1", "") ?: ""
                val eventLine2 = widgetData.getString("day_${i}_event_line2", "") ?: ""
                val fullDateStr = widgetData.getString("day_${i}_date", null)

                val numberId = context.resources.getIdentifier("day_${i}_number", "id", context.packageName)
                val eventLine1Id = context.resources.getIdentifier("day_${i}_event_line1", "id", context.packageName)
                val eventLine2Id = context.resources.getIdentifier("day_${i}_event_line2", "id", context.packageName)

                views.setTextViewText(numberId, dayNumber)
                views.setTextViewText(eventLine1Id, eventLine1)
                views.setTextViewText(eventLine2Id, eventLine2)

                var isToday = false

                if (fullDateStr != null) {
                    try {
                        val parts = fullDateStr.substring(0, 10).split("-")
                        val year = parts[0].toInt()
                        val month = parts[1].toInt()
                        val day = parts[2].toInt()
                        isToday = (year == todayYear && month == todayMonth && day == todayDay)
                    } catch (e: Exception) {
                        }
                }
                
                if (isToday) {
                    views.setTextColor(numberId, Color.RED)
                    views.setTextColor(eventLine1Id, Color.RED)
                    views.setTextColor(eventLine2Id, Color.RED)
                } else {
                    val isDim = widgetData.getString("day_${i}_isDim", "false") == "true"
                    if (isDim) {
                        views.setTextColor(numberId, Color.GRAY)
                        views.setTextColor(eventLine1Id, Color.GRAY)
                        views.setTextColor(eventLine2Id, Color.GRAY)
                    } else {
                        views.setTextColor(numberId, Color.BLACK)
                        views.setTextColor(eventLine1Id, Color.DKGRAY)
                        views.setTextColor(eventLine2Id, Color.DKGRAY)
                    }
                }
                
            }

            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}
