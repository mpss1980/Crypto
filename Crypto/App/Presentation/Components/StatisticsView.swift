//
//  StatisticsView.swift
//  Crypto
//
//  Created by Field on 08/01/25.
//

import SwiftUI

struct StatisticsView: View {
    let stat: Statistics

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)

            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(
                        Angle(
                            degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180
                        )
                    )

                Text(stat.percentageChange?.asPercentageString() ?? "")
                    .font(.caption)
                    .bold()

            }
            .foregroundColor(
                (stat.percentageChange ?? 0) >= 0
                    ? Color.theme.green : Color.theme.red
            )
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
    }
}

struct StatisticsView_Preview: PreviewProvider {

    static var previews: some View {

        StatisticsView(stat: dev.statistics.first!)

    }
}
